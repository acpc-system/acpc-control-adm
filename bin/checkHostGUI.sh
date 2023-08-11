#!/bin/bash
### Script, checks for boot target  graphical or no
### Accepts, Start team N, and End Team N
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
	RES=$(ssh root@${TEAM} "ps -ef|egrep '(^gdm|gdm)' |wc -l")
	#[ ${RES} -gt 2 ] && echo " .. Graphics" || echo " .. Text"
	if [ ${RES} -gt 2 ]
	then
		echo " .. Graphics" 
	else
		if [ ${CO} -eq 1 ]
		then
			echo " .. Text"
			TEXT="${TEAM}"
			CO=2
		else
			echo " .. Text"
			TEXT="${TEXT},${TEAM}"
		fi
	fi
done
echo "Total TEXT : ansible-playbook IsolateGraphics.yml --limit ${TEXT}"
exit 0

