#! /usr/bin/env bash
#
# gets one chapter of a manga
#
# Usage:
#+ ./get.sh <manga-definition-file> <chapter>


if [ ! $# -eq 2 ]; then
    echo "Usage: ./get.sh <manga-definition-file> <chapter>";
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


get "${2}" "${NAME}" "${TARGET_DIR}"
exit $?
