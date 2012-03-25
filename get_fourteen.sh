#! /usr/bin/env bash
#
# gets one chapter of 14 manga from mangareader
#
# Usage:
#+ ./get_fourteen.sh <chapter>

. lib/mangareader.sh

if [ ! $# -eq 1 ]; then
    echo "Usage: ./get_fourteen.sh <chapter>";
    exit 1;
fi

# name of manga on mangareader.
NAME="fourteen"

# local directory in which mangas will be saved.
TARGET_DIR="${HOME}/mangareader/fourteen"

get "$1" "${NAME}" "${TARGET_DIR}"
exit $?
