#!/bin/bash

function use() {
    echo "Use: tabla {1,..10}"
}

if [[ $# -ne 1 ]]
then
    echo "Error: El número de parámetros debe ser exactamente 1"
    exit
fi
if [[ $1 -gt 10 || $1 -lt 1 ]]
then
    echo "Error: El parámetro debe estar comprendido entre 1 y 10"
    echo "El valor recibido es: $1"
    exit
fi
num=$1
echo "Tabla de multiplicar del $num"
for i in $(seq 1 10)
do
    it=$((num * i))
    echo "$num x $i = $it"
done
