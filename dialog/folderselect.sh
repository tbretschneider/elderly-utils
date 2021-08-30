#!/bin/bash
currentdir=$1
let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=($i "$line")
    Actual[$i]="$line"
done < <( find "${currentdir}" -maxdepth 1 -type d )
FILE=$(dialog --backtitle "ORDNER AUSWAHL" --title "Liste der Ordner im Jetzigen Verzeichnis" --menu "Wahlen Sie Eins" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
clear
FILE="${Actual[$FILE]}"

