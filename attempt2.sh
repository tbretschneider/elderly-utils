#!/bin/bash
 
while true
do
 read -r -p "Sind sie sich sicher das sie das ScanProgram Starten Wollten? Wenn ja dann drucken sie jetzt die 'j' Taste auf der Tastertur und danach die enter taste. Sonst die 'n' taste drucken. [j/n] " input
 
 case $input in
     [jJ])
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 echo "Das Program Startet Jetzt!"
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
# scanprogram
 break
 ;;
     [nN])
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 echo "Das Program wurde geaendet!"
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 break
        ;;
     *)
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 echo "Das habe ich nicht verstanden"
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 sleep 1
 ;;
 esac
done
