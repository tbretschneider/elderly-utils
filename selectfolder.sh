#!/bin/bash
reason=$1
confirm="confirmation1.sh"
dashes2="source dashes.sh"
echo "Sie waehlen jetzt einen Bereits Existierenden Ordner aus um $1"

while true
do
  echo -e "Wollen sie den ordner \033[33;7m$(pwd)\033[0m auswahlen [j/n]"
  read -r -p "Hier j oder n eingeben:" input
  case $input in
	        "")   $dashes2
		                sleep 1
	               echo "Das habe ich nicht kapiert, versuchen sie es bitte erneut"
		                sleep 1
	               $dashes2	;;
	        j|J) 	$dashes2
		                sleep 1
				$confirm "Den ordner $(pwd) benutzen"
		                if [ $? -eq 0 ]; then
		                   break
		                else
		                   $dashes2
		                   sleep 1
		                   echo "Wahlen sie jetzt dann erneut aus"
		                   sleep 1
		                   $dashes2
		                fi
		                ;;
	        n|N) 	$dashes2
		                sleep 1
		                $confirm "Anderen Ordner Ausuchen"
		                if [ $? -eq 0 ]; then
  echo -e "Gleich wird eine liste Ordner gedruckt in \033[33;7m$(pwd)\033[0m. \n Waehlen sie dann bitte eine Nummer..."
  sleep 3
  printf "Waehlen sie bitte einen Ordner:\n"
  select d in */; do test -n "$d" && break; echo ">>> Hat leider Nicht Geklappt"; done
  cd "$d"
  $confirm "Sind sie sich sicher in den Order $(pwd) zu gehen"
  if [ $? -eq 0 ]; then
	  echo -e "Alles Klar sie sind jetzt im \033[33;7m$(pwd)\033[0m ordner"
  else
	  cd ..
	  echo "Wahlen sie dann erneut aus"
  fi
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
