#!/bin/bash
optionsfile=$1
backtitle=$2
title=$3
menu=$4
let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=($i "$line")
    Actual[$i]="$line"
done < "$optionsfile"
OUTPUT=$(dialog --backtitle "${backtitle}" --title "${title}" --menu "${menu}" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3)
clear
OUTPUT="${Actual[$FILE]}"

