#! /usr/bin/env bash
#
# gets one chapter of a manga
#
# Usage:
#+ ./get.sh <manga> <chapter>


if [ ! $# -eq 2 ]; then
    echo "Usage: ./get.sh <manga> <chapter>";
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


get "${2}" "${NAME}" "${TARGET_DIR}"
exit $?
