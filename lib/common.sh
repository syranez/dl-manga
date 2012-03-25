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
