#!/bin/bash

in_file="$1"
country_obj="$2"
count=0
while read -r line
do
    country=$(echo "$line" | cut -d"," -f2)
    if [[ "$country" == "$country_obj" ]]
    then
        inhabitants=$(echo "$line" | cut -d"," -f3)
        count=$(($count + $inhabitants))
    fi
done < "$in_file"
echo $count