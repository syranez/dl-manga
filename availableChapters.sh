#! /usr/bin/env bash
#
# gives the numeric name of chapters that are availabe.
#
# Usage:
#+ ./availableChapters <manga>


if [ ! $# -eq 1 ]; then
    echo "Usage: ./availableChapters.sh <manga>";
    exit 1;
fi

if [[ ! -f ./data/${1}.sh ]]; then
    echo "Unknown manga ${1}. Please add first a manga definition file."
    exit 2;
else 
    . "data/${1}.sh"
fi

if [[ ! -f ./lib/${SOURCE}.sh ]]; then
    echo "Unknown source type ${SOURCE}. Please define the source of manga."
    exit 3;
else 
    . "./lib/${SOURCE}.sh"
fi

availableChapters () {

    local chapters=$(getAvailableChapters "${INDEX_SITE}" "${NAME}");
    echo "Available Chapters: ${#chapters}"

    declare -a uniqueChapters="";
    if [[ ! ${#chapters} -eq 0 ]]; then

        # uniq chapters
        for chapter in $chapters; do

            uniqueChapters["${chapter}"]="${chapter}";
        done;

        echo ${uniqueChapters[*]};
#        echo "${chapters}";
    fi

    return 0;
}

availableChapters

exit
