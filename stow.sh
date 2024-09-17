#/bin/sh

arguments="--adopt -v"
arguments_soft="--adopt -nv"
confirm="n"
force="n"

if [[ $# -eq 0 || $# -gt 1 ]]; then
    echo "Error syntax. Usage : ./stow.sh <source_dir>"
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
    stow $arguments_soft $1
    read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
    stow $arguments $1

    exit 0
else
    stow $arguments $1
    exit 0
fi
