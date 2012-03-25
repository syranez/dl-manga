#! /usr/bin/env bash
#
# gets one chapter of one piece manga from onepiece-tube
#
# Usage:
#+ ./get_onepiece_ger.sh <chapter>

. lib/onepiecetube.sh

if [ ! $# -eq 1 ]; then
    echo "Usage: ./get_onepiece_ger.sh <chapter>";
    exit 1;
fi

# local directory in which mangas will be saved.
TARGET_DIR="${HOME}/mangareader/onepiece/german"

get "$1" "${NAME}" "${TARGET_DIR}"
exit $?
