#!/bin/bash
### Script, checks for samples
### Accepts, Start team N, and End Team 
## Exit codes
##	0:  Success
##	1: Not enough parameters
[ ${#} -ne 2 ] && echo "Not enough parameters" && exit 1

START=${1}
END=${2}
CO=1
TEXT=""
for i in $(seq ${START} ${END}) 
do
	TEAM="team${i}"
	echo -n "Checkig host ${TEAM} .. "
	#RES=$(ssh root@${TEAM} "ps -ef|grep xdg-desktop|wc -l")
	RES=$(ssh root@${TEAM} "ls -l /home/${TEAM}/Desktop/samples/*|wc -l")
	echo ".. ${RES}"

done
exit 0

