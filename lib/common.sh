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

# prefixes a name zeroes.
#
# @param string name
# @param number digit count
# @output string new name
zeroPrefix () {

    local name=${1}
    local length=${#name};
    local diff=$((${2} - length));
    local prefix="";

    for (( i=1; i<=diff; i++)); do
        prefix="${prefix}0";
    done;

    echo "${prefix}${name}"
}
