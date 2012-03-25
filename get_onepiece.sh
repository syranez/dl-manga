#! /usr/bin/env bash
#
# gets one chapter of one piece manga from mangareader
#
# Usage:
#+ ./getop.sh <chapter>

. lib/mangareader.sh

if [ ! $# -eq 1 ]; then
    echo "Usage: ./getop.sh <chapter>";
    exit 1;
fi

# name of manga on mangareader.
NAME="one-piece"

# local directory in which mangas will be saved.
TARGET_DIR="${HOME}/mangareader/onepiece"

get "$1" "${NAME}" "${TARGET_DIR}"
exit $?
