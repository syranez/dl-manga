# dl-mangareader

dl-mangareader is a bash framework for downloading an manga chapter from an online manga viewer.

For every manga you want to retrieve you have to create a manga definition file. That file includes the source site, the manga and some more options for the site. If there is no such manga definition file for youre manga available, you have to write one. See chapter "Creating a manga definition file" for instructions.

Currently supported manga viewer sites are

1. mangareader.net
1. onepiece-tube.com

## Functionality

1. Download a manga

    ./get <manga> <chapter>

2. Get available chapters

    ./availableChapters <manga>

3. Check for new chapters

    ./newChapters <manga>

## get-Usage

If there is already a script for your manga, then all you have to do is:

1. $EDITOR data/<manga> and configure it as you wish.
2. execute ./get.sh <manga> <chapter>
3. Be happy and buy the paper book if available.

## Creating a manga definition file

If no manga definition file exist for your mange, then you have to write one. Do not worry, it is easy :)

1. cp data/skeleton.sh data/<manga>.sh
2. open data/<manga>.sh with your favorite $EDITOR.
3. Set the source site.
4. Set the name of mange on the source site.
5. Set your download folder
6. Optional: Make some tuning for the source site.
7. Download chapter and be happy and support the manga producer.



The Software shall be used for Good, not Evil.
