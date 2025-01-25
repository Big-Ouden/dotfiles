#!/bin/bash

arguments="-sf"

if [[ $# -eq 0 || $# -gt 2 ]]; then
    echo "Error syntax. Usage : ./change_background.sh <source_background>"
    exit 1
fi

rm $HOME/dotfiles/config/dot-config/i3/theme/wallpaper
ln $arguments $HOME/dotfiles/$1 $HOME/dotfiles/config/dot-config/i3/theme/wallpaper
echo "ln $arguments $HOME/dotfiles/$1 ./wallpaper/chosen_background"
hsetroot -cover $HOME/dotfiles/$1 

exit 0



