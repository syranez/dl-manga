#! /usr/bin/env sh
#
# prefixes chapter directorys with zeros.
#
# Usage:
#     ./prefix <directory> (<digit_count>)
#
#     digit_count is optional. Default is 3.

. ../lib/common.sh

if [ $# -gt 2 ]; then
    echo "Usage: ./prefix <directory> (<digit_count>)";
    exit 1;
fi

# manga chapter directory.
#
# @value string
DIR=${1}

if [ ! -d "${DIR}" ]; then
    echo "Directory ${DIR} does not exist."
    exit 1;
fi


# format a chapter directory to have count digits
# default value is 3
#
# @value number
DIGIT_COUNT=${2-3}

prefix () {

    for name in $(ls $1); do
        if [ ! ${#name} -eq ${DIGIT_COUNT} ]; then
            newname=$(zeroPrefix ${name} ${DIGIT_COUNT})
        fi;
        echo "mv -v" "${1}/${name}" "${1}/${newname}"
    done;
}

prefix "${DIR}"
