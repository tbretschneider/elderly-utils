#!/bin/bash
confirm="confirmation1.sh"
dashes2="source dashes.sh"
echo "Es wird jetzt ein neuer ordner im Verzeichnis $(pwd) erstellt!"
$confirm "Neuen Ordner erstellen"
if [ $? -eq 0 ]; then
	while true 
	do
	read -r -p "Name Des Ordners Eingeben, ohne leerzeichen bitte!: " newfoldername
		$confirm "Den neuen Ordner $newfoldername nenen"
		if [ $? -eq 0 ]; then
		    break 
		else 
			echo "Geben sie es dann erneut ein"
		fi
	done 
	mkdir "${newfoldername}"
	cd "${newfoldername}"
else
	echo "Sie befinden sich immer noch im ordner $(pwd)"
fi
