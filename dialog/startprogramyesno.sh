#!/bin/bash
programname=$1
dialog --title "Program Starten" \
	--backtitle "${programname}" \
--yesno "Sind sie sich sicher das sie dass programm ${programname} starten wollen?" 7 60

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
