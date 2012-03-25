#! /usr/bin/env bash
#
# skeleton downloader
#
# Each downloader has this interface:
#+
#+ ./skeleton.sh <chapter>

# include get functionality for the site from which you want to get the manga.
#
#  Site            => statement
#+============================
#+ mangareader.net   => . lib/mangareader.sh
#+ onepiece-tube.com => . lib/onepiecetube.sh
. lib/mangareader.sh

if [ ! $# -eq 1 ]; then
    echo "Usage: ./skeleton.sh <chapter>";
    exit 1;
fi

# name of manga on mangareader.
#+ this is the name used in the uri
#+ e. g. One Piece => one-piece
#
# mangareader.net-only configuration parameter
NAME="change-me"

# number of digits used in name of chapter directory
#+ normally a chapter 1 would generate a directory 1
#+ but with this set to 3 you get prefixed zeros: 001
#
# mangareader.net-only configuration parameter
DIGIT_COUNT=3

# local directory in which mangas will be saved.
#
# all sites.
TARGET_DIR="~/mangareader/changeme"

get "$1" "${NAME}" "${TARGET_DIR}"
exit $?
