#!/bin/bash

in_file="$1"
out_file="$2"

if [[ -f "$out_file" ]]
then
    rm $out_file
    touch $out_file
fi

while read -r line
do
    line_to_read=$(echo $line | cut -d"," -f1)
    file_to_read=$(echo $line | cut -d"," -f2)
    it=0
    while read -r line_file
    do
        it=$((it + 1))
        if [[ $it -eq $line_to_read ]]
        then
            echo "$line_file" >> "$out_file"
            break
        fi
    done < "$file_to_read"
done < "$in_file"