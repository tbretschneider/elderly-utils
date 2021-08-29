#!/bin/bash
confirm="confirmation1.sh"
dashes2="source dashes.sh"
echo "Bitte die datei ohne nur mit den 26 a..z bennen und ohne leerzeichen!"
while true 
do
	read -r -p "Neue Datei Name Eingeben: " newfilename
	if [ -f "$newfilename" ]
	then 
		echo "diese datei gibt es bereits"
	else
		$confirm "Die neue Datei $newfilename nenen"
		if [ $? -eq 0 ]; then
		    export newfilename
		    break 
		else 
			echo "Geben sie es dann erneut ein"
		fi 
	fi
done 
