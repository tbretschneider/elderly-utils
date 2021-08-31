#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$

# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}

checkstart="./startprogramyesno.sh"
folderselect="./folderselect.sh"
foldername="./foldername.sh"
filename="./filename.sh"
source $checkstart "Scan Program"

case $response in 
	1) exit;;
	255) exit;;
	*) say "Super";;
esac

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

#
# Purpose - display output using msgbox 
#  $1 -> set msgbox height
#  $2 -> set msgbox width
#  $3 -> set msgbox title
#
function nachricht() {
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "Scan Program" --title "Meldung" --clear --msgbox "${t}" ${h} ${w}
}
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Scan Program" \
--title "Haupt Menu" \
--menu "Benutzen sie die HOCH/RUNTER Pfeil tasten, \n\
den Ersten Buchstabe der auswahl, oder \n\
die Ziffern 1-9 um eine auswahl zu treffen. \n\
Wahlen sie jetzt eine Action!" 15 50 4 \
Bild "Ein Bild Scannen" \
EineSeite "Eine Dokument Seite zum pdf" \
MehrereSeiten "Mehr seitiges Dokument zum pdf" \
Schliessen "Program Schliessen" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion 
case $menuitem in
	Bild) plan=1; nachricht 6 60 "Sie Werden Jetzt Ein Bild Scannen";;
	EineSeite) plan=2; nachricht 6 60 "Sie Werden Jetzt Eine Seite Scanenn";;
	MehrereSeiten) plan=3; nachricht 6 60 "Sie Werden Jetzt ein Dokument Scannen";;
	Schliessen) nachricht 6 60 "Das Program Endet Jetzt!"; break;;
esac

nachricht 7 60 "Die Datei wird im Ordner 'scans' gespeichert. Man kann ihn finden in dem man scans in die Aktivtaten ubersicht schreibt."

mkdir -p "~/scans"

FILE="~/scans"


ydm=$(date -I)
time=$(date | awk '{print $4}')

filename="${ydm}-${time}"

newfilename="${FILE}/${filename}"

nachricht 7 60 "Die datei wird als ${filename}.png/.pdf gespeichert"

if [ $plan -eq 1 ]; then
	nachricht 7 60 "Jetzt bitte Bild Einlegen. Ok Drucken wenn fertig!"
	scanimage -p --format=png -o "${newfilename}.png"
	nachricht 7 60 "Das bild wurde gescannt sie Konnen Es jetzt anschauen"
		eog "${newfilename}.png"
		echo "Ok dann bist du fertig"
elif [ $plan -eq 2 ]; then
	nachricht 7 60 "Jetzt bitte Seite Einlegen. Ok Drucken wenn fertig!"
	scanimage -p --format=png -o "/tmp/${filename}.png"
	convert "/tmp/${filename}.png" "${newfilename}.pdf"
	nachricht 7 60 "Das Bild wurde gescannt sie Koennen es jetzt anschauen"
		evince "${newfilename}.pdf"
else 
	page=1
	while true
	do 
		nachricht 7 60 "Bitte Naechste oder erste Seite Einlegen. Enter Drucken wenn fertig"
		scanimage -p --format=png -o "/tmp/test.png"
		convert "/tmp/test.png" "/tmp/${page}.pdf"
		dialog --title "Fertig?" \
			--backtitle "Scan Program" \
			--yesno "Wollen sie noch eine Seite Scannen" 7 60
		if [ $? -eq 0 ]
	       	then
			page=$((page+1))
		else 
		        nachricht 7 60 "Enter drucken um das pdf zu generieren"
			break
		fi
	done
	realpage=$((page-1))
	Z=()
	for i in {1..$realpage}
	do
		Z+=("/tmp/${i}.pdf")
	done
	pdftk $Z[*] cat output /tmp/combined.pdf
	cp /tmp/combined.pdf "${newfilename}.pdf"
	nachricht 7 60 "Sie konnen sich jetzt das pdf anschauen"
	evince "${newfilename}.pdf"
fi

done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT
