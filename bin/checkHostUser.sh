#!/bin/bash
### Script, checks for user
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
	RES=$(ssh root@${TEAM}  "grep -c "${TEAM}: /etc/passwd )
	if [ ${RES} -eq 1 ]
	then
		echo " .. Exists" 
	else
			echo " .. Not exist"
			TEXT="${TEAM}"
	fi
done
exit 0

