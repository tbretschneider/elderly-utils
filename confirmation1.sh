#!/bin/bash
 
action=$1
while true
do
 read -r -p "Sind sie sich das Sie $action ausfuehren wollen? [j/n] " input
 
 case $input in
     [jJ])
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 echo "Die Gewaehlte action wird jetzt ausgefuehrt :)"
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
# scanprogram
 break
 ;;
     [nN])
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 echo "Sie haben die action abgebrochen!"
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 exit 2
 break
        ;;
     *)
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 echo "Das habe ich nicht verstanden, versuchen sie es erneut!"
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
 sleep 1
 ;;
 esac
done
