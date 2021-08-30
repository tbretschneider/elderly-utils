#!/bin/bash
# yesnobox.sh - An inputbox demon shell script
OUTPUT="/tmp/input.txt"

# create empty file
>$OUTPUT

# show an inputbox
dialog --title "Neuen Ordner Bennen" \
--backtitle "Scan Program" \
--inputbox "Neuen Ordner Name Eingeben" 8 60 2>$OUTPUT

# get respose
respose=$?

# get data stored in $OUPUT using input redirection
name=$(<$OUTPUT)

name=$(echo $name | tr -cd "[:alnum:]")

# make a decsion 
case $respose in
  0) 
  	mkdir -p "${FILE}/${name}"
  	;;
  1) 
  	
  	;;
  255) 
   exit
esac

# remove $OUTPUT file
rm $OUTPUT
