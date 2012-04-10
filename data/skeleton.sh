# skeleton manga data file.
#
#

# load the framework for the manga site.
#
# If the site is not listed here, the site is not supported.
#
#  Site              => value
#+============================
#+ mangareader.net   => mangareader
#+ onepiece-tube.com => onepiecetube
#+
SOURCE="change-me"

# name of manga on the site.
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

# index site of manga
#
# mangareader.net-only configuration parameter
INDEX_SITE="change-me"
