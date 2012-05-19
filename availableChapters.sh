#! /usr/bin/env bash
#
# gives the numeric name of chapters that are availabe.
#
# Usage:
#+ ./availableChapters <data-definition-file>


if [ ! $# -eq 1 ]; then
    echo "Usage: ./availableChapters.sh <data-definition-file>";
    exit 1;
fi

if [[ ! -f ${1} ]]; then
    echo "Unknown data-definition-file ${1}."
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

availableChapters () {

    local chapters=$(getAvailableChapters "${INDEX_SITE}" "${NAME}");

    declare -A uniqueChapters;
    if [[ ! ${#chapters} -eq 0 ]]; then

        # uniq chapters
        for chapter in $chapters; do

            uniqueChapters["${chapter}"]="${chapter}";
        done;

    fi
    echo "Available Chapters: ${#uniqueChapters[*]}"
    echo ${uniqueChapters[*]};

    return 0;
}

availableChapters

exit
