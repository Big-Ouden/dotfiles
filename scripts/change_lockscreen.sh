
#!/bin/bash

arguments="-u"

if [[ $# -eq 0 || $# -gt 2 ]]; then
    echo "Error syntax. Usage : ./change_lockscreen.sh <source_background>"
    exit 1
fi


betterlockscreen -u $HOME/dotfiles/$1

exit 0
