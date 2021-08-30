#!/bin/bash
# yesnobox.sh - An inputbox demon shell script
OUTPUT="/tmp/input2.txt"

# create empty file
>$OUTPUT

# show an inputbox
dialog --title "Datei Bennen" \
--backtitle "Scan Program" \
--inputbox "Neuen Datei Namen Eingeben" 8 60 2>$OUTPUT

# get respose
respose=$?

# get data stored in $OUPUT using input redirection
filename=$(<$OUTPUT)

filename=$(echo $filename | tr -cd "[:alnum:]")

# make a decsion 
case $respose in
  0) 
	  nachricht 6 60 "Die Datei wird ${filename} bennant!"
  	;;
  1) 
  	
  	;;
  255) 
   exit
esac

# remove $OUTPUT file
rm $OUTPUT
