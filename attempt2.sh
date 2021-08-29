#!/bin/bash
dashes2="./dashes.sh" 
scanprogram="./scanprogram.sh"
while true
do
 read -r -p "Sind sie sich sicher das sie das ScanProgram Starten Wollten? Wenn ja dann drucken sie jetzt die 'j' Taste auf der Tastertur und danach die enter taste. Sonst die 'n' taste drucken. [j/n] " input
 
 case $input in
     [jJ])
 $dashes2
 echo "Das Program Startet Jetzt!"
 $dashes2
 $scanprogram
 break
 ;;
     [nN])
 $dashes2
 echo "Das Program wurde geaendet!"
 $dashes2
 break
        ;;
     *)
 $dashes2
 echo "Das habe ich nicht verstanden"
 $dashes2
 sleep 1
 ;;
 esac
done
