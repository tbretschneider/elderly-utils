#!/bin/bash

workingdir=$(pwd)
confirm="confirmation1.sh"
dashes2="dashes.sh"
selectfolder="selectfolder.sh"
makenewfolder="makenewfolder.sh"

while true 
do 
	echo -e "Was wollen sie Heute machen? Die Optionen sind; \n 1) Einzelnes Bild Scannen \n 2) Ein Dokument Scanen \n 3) mehr Seitiges Dokument Scannen \n Geben Sie 1,2,3 ein und drueken sie dann die Enter Taste"
	sleep 1
	read -r -p "Hier eingeben:" input

	
	case $input in 
		"")   $dashes2
			sleep 1
		       	echo "Das habe ich nicht kapiert, versuchen sie es bitte erneut"
			sleep 1
		       	$dashes2	;;
		1) 	$dashes2
			sleep 1
			$confirm "Bild Scannen" 
			if [ $? -eq 0 ]; then
			   plan=1
			   break
			else
			   $dashes2
			   sleep 1
			   echo "Wahlen sie jetzt dann erneut aus"
			   sleep 1
			   $dashes2
			fi
			;;
		2) 	$dashes2
			sleep 1
			$confirm "Eine Seite Scannen" 
			if [ $? -eq 0 ]; then
			   plan=2
			   break
			else
			   $dashes2
			   sleep 1
			   echo "Wahlen sie jetzt dann erneut aus"
			   sleep 1
			   $dashes2
			fi ;;
		3) 	$dashes2
			sleep 1
			$confirm "Mehrere Seite Scannen" 
			if [ $? -eq 0 ]; then
			   plan=3
			   break
			else
			   $dashes2
			   echo "Wahlen sie jetzt dann erneut aus"
			   $dashes2
			fi ;; 
		*)   $dashes2
			sleep 1
		       	echo "Das habe ich nicht kapiert, versuchen sie es bitte erneut"
			sleep 1
		       	$dashes2	;;
	esac
done
echo $plan
sleep 1
while true 
do 
	echo -e "Sie Mussen jetzt auswahlen ob sie die Dateien in einen Neuen oder Bereits Existierenden Ordner Speichern Wollen. \n 1) Bereits Existierenden \n 2) Neuen Ordner \n1 oder 2 eingeben bitten und dann natuerlich enter drucken..."
	sleep 1
	read -r -p "Hier eingeben:" input

	
	case $input in 
		"")   $dashes2
			sleep 1
		       	echo "Das habe ich nicht kapiert, versuchen sie es bitte erneut"
			sleep 1
		       	$dashes2	;;
		1) 	$dashes2
			sleep 1
			$confirm "Bereits Existierenden" 
			if [ $? -eq 0 ]; then
			   saving=1
			   break
			else
			   $dashes2
			   sleep 1
			   echo "Wahlen sie jetzt dann erneut aus"
			   sleep 1
			   $dashes2
			fi
			;;
		2) 	$dashes2
			sleep 1
			$confirm "Neuen Ordner!" 
			if [ $? -eq 0 ]; then
			   saving=2
			   break
			else
			   $dashes2
			   sleep 1
			   echo "Wahlen sie jetzt dann erneut aus"
			   sleep 1
			   $dashes2
			fi ;;
		*)   $dashes2
			sleep 1
		       	echo "Das habe ich nicht kapiert, versuchen sie es bitte erneut"
			sleep 1
		       	$dashes2	;;
	esac
done

echo $saving

if [ $saving -eq 1 ]; then
	$selectfolder "zum direkt speichern"
else
	$selectfolder "um einen neuen Ordner zu machen"
	$makenewfolder
fi


