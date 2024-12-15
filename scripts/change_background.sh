#!/bin/bash

arguments="-sf"

if [[ $# -eq 0 || $# -gt 2 ]]; then
    echo "Error syntax. Usage : ./change_background.sh <source_background>"
    exit 1
fi

rm ./wallpaper/chosen_background
ln $arguments $HOME/dotfiles/$1 ./wallpaper/chosen_background
# echo "ln $arguments $HOME/dotfiles/$1 ./wallpaper/chosen_background"
hsetroot -cover $HOME/dotfiles/wallpaper/chosen_background

exit 0



