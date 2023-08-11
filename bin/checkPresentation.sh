#!/bin/bash
## Script checks for the presentation
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
TEAM="team${i}"
echo -n "Checking presentation at ${TEAM} "
RES=$(ssh root@${TEAM} ps -ef|grep -c startclient)
if [ ${RES} -ge 1 ] 
then
	echo " .. is running"
	else
		echo " .. not running"
fi

done
exit 0
