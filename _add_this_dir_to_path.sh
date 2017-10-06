#!/bin/bash

FILE_TO_ADD_PATH="/home/$USER/.bashrc"
PATH_TO_ADD="$(dirname $(readlink -f $0))"
STRING_TO_APPEND="\nPATH=\"$PATH_TO_ADD:\$PATH\""

printf $STRING_TO_APPEND >> $FILE_TO_ADD_PATH
