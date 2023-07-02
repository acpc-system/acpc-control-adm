#!/bin/bash
if [ ${#} -ne 2 ]
then
	echo "Insufficent parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do

echo "working with team${i}"
scp /acpc/prog/common/icon/* root@team${i}:/home/administrator
#scp /home/administrator/icon/*.jpeg root@team${i}:/home/administrator
scp  /home/administrator/shortteam/*.desktop root@team${i}:/home/team${i}/Desktop

done
