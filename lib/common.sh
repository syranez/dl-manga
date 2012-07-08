#! /usr/bin/env bash
#
# common library code for all sites.

# creates target directories
#
# @access private
init () {

    if [ ! -d "${CHAPTER_BASE}" ]; then
        mkdir -p "${CHAPTER_BASE}"
    fi
}

# prefixes a name with zeroes.
#
# @param number chapter name
# @param number digit count
# @output string new name
zeroPrefix () {

    local name=${1}
    local count=${2};
    local result="";

    printf -v result "%0${count}d" ${name}

    echo "${result}"
}
