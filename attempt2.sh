#!/bin/bash
dashes2="dashes.sh" 
scanprogram="scanprogram.sh"
while true
do
 read -r -p "Sind sie sich sicher das sie das ScanProgram Starten Wollten? Wenn ja dann drucken sie jetzt die 'j' Taste auf der Tastertur und danach die enter taste. Sonst die 'n' taste drucken. [j/n] " input
 sleep 1
 case $input in
     [jJ])
 $dashes2
 sleep 1
 echo -e "\033[33;7mDas Program Startet Jetzt!\033[0m"
 sleep 1
 $dashes2
 $scanprogram
 break
 ;;
     [nN])
 $dashes2
 echo -e "\033[33;7mDas Program wurde geaendet!\033[0m"
 $dashes2
 break
        ;;
     *)
 $dashes2
 echo -e "\033[33;7mDas habe ich nicht verstanden\033[0m"
 $dashes2
 sleep 1
 ;;
 esac
done
