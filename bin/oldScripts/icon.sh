#!/bin/bash
if [ ${#} -ne 2 ]
then
	echo "Insufficent parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do

echo -n "working with team${i}"
scp /acpc/prog/common/icon/* root@team${i}:/usr/src/ > /dev/null 2> /dev/null
if [ ${?} -ne 0 ] 
then	
	 echo -n "  .. Failed" 
 else
	scp  /acpc/prog/common/teams-desktop-entry/*desktop root@team${i}:/home/team${i}/Desktop > /dev/null 2>/dev/null
	[ ${?} -ne 0 ] && echo -n " .. Failed" 
fi
echo ""


done
