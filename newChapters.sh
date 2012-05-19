#! /usr/bin/env bash
#
# gives the numeric name of chapters that are not downloaded (=e. g. cos new)
#
# Usage:
#+ ./newChapters <manga-definition-file>


if [ ! $# -eq 1 ]; then
    echo "Usage: ./available.sh <manga-definition-file>";
    exit 1;
fi

if [[ ! -f ${1} ]]; then
    echo "Unknown manga-definition-file ${1}."
    exit 2;
else 
    . "${1}"
fi

if [[ ! -f ./lib/${SOURCE}.sh ]]; then
    echo "Unknown source type ${SOURCE}. Please define the source of manga."
    exit 3;
else 
    . "./lib/${SOURCE}.sh"
fi

# outputs all names (numeric) of new chapters of a manga.
#
# @output string new chapters
# @access public
getNewChapters () {

    declare -a newChapters=($(detectNewChapters));

    echo "New Chapters: ${#newChapters[*]}";

    if [[ ! ${#newChapters[*]} -eq 0 ]]; then
        echo ${newChapters[*]} | tr " " "\n"
    fi

    return 0;
}

getNewChapters;

exit;
