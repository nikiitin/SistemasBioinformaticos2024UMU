#!/bin/bash
function use() {
    echo "ej1.sh string0 string1 [string2..stringN]"
}


if [[ $# -lt 2 ]]
then
    echo "Se requieren dos argumentos."
    use
    exit
fi

args=("$@")
last_arg=$(($# - 1))
echo "El primer argumento es ${args[0]}"
echo "El último argumento es ${args[$last_arg]}"