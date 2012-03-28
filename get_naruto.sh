#! /usr/bin/env bash
#
# gets one chapter of naruto manga from mangareader
#
# Usage:
#+ ./get_naruto.sh <chapter>

. lib/mangareader.sh

if [ ! $# -eq 1 ]; then
    echo "Usage: ./get_naruto.sh <chapter>";
    exit 1;
fi

# name of manga on mangareader.
NAME="naruto"

# number of digits of the output chapter directory name
DIGIT_COUNT=3

# local directory in which mangas will be saved.
TARGET_DIR="${HOME}/mangareader/naruto"

get "$1" "${NAME}" "${TARGET_DIR}"
exit $?
