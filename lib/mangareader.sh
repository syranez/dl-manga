#! /usr/bin/env bash
#
# library code for getting a chapter of a manga from mangareader
#
# download scripts should only call #get

. lib/common.sh

# gets the manga
#
# @param string chapter of manga
# @param string name of manga
# @param string target directory in which manga will be stored
# @return number exit status
# @access public
get () {

    if [ ! $# -eq 3 ]; then
        echo "Usage: get <chapter> <name-of-manga> <target-dir>";
        exit 1;
    fi

    CHAPTER="$1"
    DIGIT_COUNT=${DIGIT_COUNT-""}

    # URI to main page of chapter
    URI="http://www.mangareader.net/${2}/${1}"

    BASE="${3}"

    if [[ "${DIGIT_COUNT}" =~ ^[0-9]$ ]]; then
        OUTPUT_CHAPTER=$(zeroPrefix ${CHAPTER} ${DIGIT_COUNT})
    else
        OUTPUT_CHAPTER="${CHAPTER}"
    fi

    # directory of chapter
    CHAPTER_BASE="${BASE}/${OUTPUT_CHAPTER}"

    init;

    echo "Get chapter ${CHAPTER}..."
    getPages
    return $?
}

# outputs name (numeric) of all chapters of a manga
#
# @param string URI of manga page
# @param string Name of Manga on mangareader.net
# @output string
# @access public
getAvailableChapters () {

    local chapters=$(wget -q "${1}" -O - | grep "<a href=\".*/${2}" | sed 's/">.*//g' | sed "s#<a href=\"/${2}/##g" | sed 's/.*chapter-//g' | sed 's/\.html//g');

    echo "${chapters}"
}

# detects new chapters of manga
#
# @output string new chapters
# @access public
detectNewChapters () {

    local chapters=$(getAvailableChapters "${INDEX_SITE}" "${NAME}");
    declare -a newChapters=();

    for chapter in $chapters; do

        # zeroPrefix
        if [[ "${DIGIT_COUNT}" =~ ^[0-9]$ ]]; then
            chapter=$(zeroPrefix ${chapter} ${DIGIT_COUNT})
        else
            chapter="${chapter}"
        fi

        if [[ ! -d "${TARGET_DIR}/${chapter}" ]]; then

            newChapters["${chapter}"]="${chapter}";
        fi;
    done;

    echo "${newChapters[*]}";
}





# returns page count of chapter
#
# @return count
# @access private
getPageCount () {

    local pages=$(wget -q "${URI}" -O - | grep '</select> of ' | sed 's#</select> of ##g' | sed 's#</div>##g')

    return $pages;
}

# outputs URI of manga page.
#
# @param number page
# @output string URI
# @access private
getPageUri () {

    echo "http://www.mangareader.net/${NAME}/${CHAPTER}/${1}"
}

# outputs URI of image of given manga page.
#
# @param string URI of manga page
# @output string
# @access private
getImageUri () {

    local imageuri=$(wget -q "${1}" -O - | grep 'id="img"' | sed 's/.*src="//g' | sed 's/".*//g')

    echo "${imageuri}"
}

# downloads all pages
#
# @access private
getPages () {

    getPageCount;
    local PAGES=$?
    echo "Found ${PAGES} pages."

    for (( i=1; i<=$PAGES; i++ )); do
        URI=$(getPageUri $i)
        IMAGEURI=$(getImageUri $URI)
        echo -n "Get page ${i} from ${IMAGEURI}... "
        wget -q ${IMAGEURI} --directory-prefix=${CHAPTER_BASE} -nc
        if [ $? -eq 0 ]; then
            echo ":)"
        else
            echo ":( RETRY:"
            wget ${IMAGEURI} --directory-prefix=${CHAPTER_BASE} -nc
            if [ ! $? -eq 0 ]; then
                echo "Could not download page ${IMAGEURI}"
                return 1
            fi
        fi
    done;

    return 0
}
