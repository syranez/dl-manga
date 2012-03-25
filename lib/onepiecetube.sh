#! /usr/bin/env bash
#
# library code for getting a chapter of a manga from onepiece-tube
#
# download scripts should only call #get

. lib/common.sh

# returns page count of chapter
#
# @return count
# @access private
getPageCount () {

    local pages=$(wget -q "${URI}" -O - | grep 'var lastimg = ' | sed 's#.*var lastimg = ##g' | sed 's#;.*##g')

    return ${pages};
}

# outputs URI of manga page.
#
# @param number page
# @output string URI
# @access private
getPageUri () {

    echo "http://onepiece-tube.com/kapitel/${CHAPTER}/${1}"
}

# outputs URI of image of given manga page.
#
# @param string URI of manga page
# @output string
# @access private
getImageUri () {

    local imageuri=$(wget -q "${1}" -O - | grep 'id="p"' | sed 's/.*src="//g' | sed 's/".*//g')

    echo "http://onepiece-tube.com${imageuri}"
}


# lädt alle Seiten des Kapitels herunter.
#
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
        fi
    done;
}

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

    # URI to main page of chapter
    URI="http://onepiece-tube.com/kapitel/${1}/1"

    BASE="${3}"

    # directory of chapter
    CHAPTER_BASE="${BASE}/${CHAPTER}"

    init;

    echo "Get chapter ${CHAPTER}..."
    getPages
    return $?
}
