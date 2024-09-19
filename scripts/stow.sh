#/bin/sh

arguments="--adopt -v --dotfiles"
arguments_soft="--adopt -nv --dotfiles"
confirm="n"
force="n"
DIR=$HOME/dotfiles/

if [[ $# -gt 1 ]]; then
    echo "Error syntax. Usage : ./stow.sh [options]"
    exit 1
fi

for arg in "$@"; do
    if [[ $arg == "-f" ]]; then
        force="y"
    else
        force="n"
    fi

done

if [[ $force == "n" ]]; then
    stow $arguments_soft $DIR
    read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
    stow $arguments $DIR

    exit 0
else
    stow $arguments $DIR
    exit 0
fi
