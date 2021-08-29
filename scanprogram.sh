#!/bin/bash

workingdir=$(pwd)
confirm="./confirmation1.sh"
dashes2="./dashes.sh"

while true 
do 
	echo -e "Was wollen sie Heute machen? Die Optionen sind; \n 1) Einzelnes Bild Scannen \n 2) Ein Dokument Scanen \n 3) mehr Seitiges Dokument Scannen \n Geben Sie 1,2,3 ein und drueken sie dann die Enter Taste"
	read -r -p "Hier eingeben:" input

	
	case $input in 
		""|*)   $dashes2
		       	echo "Das habe ich nicht kapiert, versuchen sie es bitte erneut"
		       	$dashes2	;;
		1) 	$dashes2
			$confirm "Bild Scannen" 
			$dashes2
			if [ $? -eq 0 ]; then
			   plan=1
			   break
			else
			   $dashes2
			   echo "Wahlen sie jetzt dann erneut aus"
			   $dashes2
			fi
			;;
		2) 	$dashes2
			$confirm "Eine Seite Scannen" 
			$dashes2
			if [ $? -eq 0 ]; then
			   plan=2
			   break
			else
			   $dashes2
			   echo "Wahlen sie jetzt dann erneut aus"
			   $dashes2
			fi ;;
		3) 	$dashes2
			$confirm "Mehrere Seite Scannen" 
			$dashes2
			if [ $? -eq 0 ]; then
			   plan=3
			   break
			else
			   $dashes2
			   echo "Wahlen sie jetzt dann erneut aus"
			   $dashes2
			fi ;;
	esac
done
./confirmation1.sh action
if [ $? -eq 0 ]; then
   echo OK
else
   echo FAIL
fi
