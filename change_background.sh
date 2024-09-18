#!/bin/bash

arguments="-sf"

if [[ $# -eq 0 || $# -gt 2 ]]; then
    echo "Error syntax. Usage : ./change_background.sh <source_background>"
    exit 1
fi

ln $arguments ../$1 ./wallpaper/chosen_background

exit 0
