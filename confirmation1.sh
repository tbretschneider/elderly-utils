#!/bin/bash
dashes2="source dashes.sh"
action=$1
while true
do
 echo -e "\033[33;7mSie haben $action ausgewahlt\033[0m"
 read -r -p "Sind sie sich Sicher das Sie $action ausfuehren wollen? [j/n] " input
 
 case $input in
     [jJ])
 $dashes2
 echo -e "\033[33;7mDie gewaehlte Action wird jetzt ausgefuehrt\033[0m"
 $dashes2
 break
 ;;
     [nN])
 $dashes2
 echo -e "\033[33;7mSie haben die action abgebrochen!\033[0m"
 $dashes2 
 exit 2
 break
        ;;
     *)
 $dashes2 
 echo -e "\033[33;7mDas habe ich nicht verstanden, versuchen sie es erneut!\033[0m"
 $dashes2 
 sleep 1
 ;;
 esac
done
