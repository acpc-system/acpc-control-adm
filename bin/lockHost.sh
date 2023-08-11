#!/bin/bash
## Script disabls keyboard and mouse
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
TEAM="team${i}"
echo -n "locking at ${TEAM} "
#ssh root@${TEAM} "nohup evtest --grab /dev/input/event4 & ; nohup --grab /dev/input/event7 &"
ssh root@${TEAM} "nohup /usr/sbin/lockInput.sh >/dev/null 2>&1 & "
echo " done"

done
exit 0
