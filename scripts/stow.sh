#/bin/sh

arguments="--adopt -v --dotfiles "
arguments_soft="--adopt -nv --dotfiles "
target="."
confirm="n"
force="n"
DIR=config

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
    error_code=$?
    if [ $error_code -ne 0 ]; then
        exit 1
    fi
    read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
    stow $arguments $DIR

    exit 0
else
    stow $arguments $DIR
    if [ $error_code -ne 0 ]; then
        exit 1
    fi
    exit 0
fi
