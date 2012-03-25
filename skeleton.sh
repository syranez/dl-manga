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
#+ mangareader.net => . lib/mangareader.sh
. lib/mangareader.sh

if [ ! $# -eq 1 ]; then
    echo "Usage: ./skeleton.sh <chapter>";
    exit 1;
fi

# name of manga on mangareader.
#+ this is the name used in the uri
#+ e. g. One Piece => one-piece
NAME="change-me"

# local directory in which mangas will be saved.
TARGET_DIR="~/mangareader/changeme"

get "$1" "${NAME}" "${TARGET_DIR}"
exit $?
