# dl-mangareader

dl-mangareader is a bash framework for downloading an manga chapter from an online manga viewer.

For every manga you want to retrieve you have to invoke a (configuration) script, that uses the framework functionality. If there is not such a script already available, you have to write it. See chapter "Extending" for instructions.

Currently supported manga viewers are

1. mangareader.net

## Usage

If there is already a script for your manga, then all you have to do is:

1. $EDITOR get_<manga>.sh and configure it as you wish.
2. execute it: ./get_<manga>.sh <chapter>
3. Be happy and buy the paper book if available.

## Extending

If there is not a script for your manga, then you have to write one. Do not worry, it is easy :)

1. cp skeleton.sh get_<manga>.sh
2. $EDITOR get_<manga>.sh and replace "<manga>" with the part of the uri from mangareader that names the manga.
3. chmod u+x get_<manga>.sh
4. Be happy and support the manga producer.



The Software shall be used for Good, not Evil.
