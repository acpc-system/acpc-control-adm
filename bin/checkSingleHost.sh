#!/bin/bash
###Script validate the S/W for the current host
TEAM=$(hostname)
DESKTOP=$(ls -l /home/${TEAM}/Desktop/*.desktop 2>/dev/null | awk ' { print $9 } ' )
CO=$(echo "${DESKTOP}" | wc -l )
[ ${CO} -le 1 ] && echo "NOSHORTCUTS" && exit 1 
for i in "${DESKTOP}"
do
	BIN=$(echo "${i}" | grep Exec| awk ' BEGIN { FS="=" } { print $2 } ')
	NAME=$(echo "${i}" | grep Name| awk ' BEGIN { FS="=" } { print $2 } ')
	echo "${BIN} : ${NAME}"
done




