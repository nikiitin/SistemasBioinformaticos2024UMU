#!/bin/bash

corrTab=("UUU:F" "CUU:L" "AUU:I" "GUU:V"
"UUC:F" "CUC:L" "AUC:I" "GUC:V"
"UUA:L" "CUA:L" "AUA:I" "GUA:V"
"UUG:L" "CUG:L" "AUG:M" "GUG:V"
"UCU:S" "CCU:P" "ACU:T" "GCU:A"
"UCC:S" "CCC:P" "ACC:T" "GCC:A"
"UCA:S" "CCA:P" "ACA:T" "GCA:A"
"UCG:S" "CCG:P" "ACG:T" "GCG:A"
"UAU:Y" "CAU:H" "AAU:N" "GAU:D"
"UAC:Y" "CAC:H" "AAC:N" "GAC:D"
"UAA:Stop" "CAA:Q" "AAA:K" "GAA:E"
"UAG:Stop" "CAG:Q" "AAG:K" "GAG:E"
"UGU:C" "CGU:R" "AGU:S" "GGU:G"
"UGC:C" "CGC:R" "AGC:S" "GGC:G"
"UGA:Stop" "CGA:R" "AGA:R" "GGA:G"
"UGG:W" "CGG:R" "AGG:R" "GGG:G"
)

# Read all lines from stdin
while IFS=$'\n' read -r line
do
    split_line=$(echo $line | sed -r 's/(.{3})/\1 /g')
    result_line=""
    for i in $split_line
    do
        for j in ${corrTab[@]}
        do
            if [[ "$j" =~ "$i" ]]
            then
                result_element=$(echo "$j" | cut -d":" -f"2")
                result_element=$(echo $result_element | sed 's/Stop/\ /')
                result_line=$(echo "$result_line$result_element")
                break
            fi
        done
    done
    echo "$result_line"
done