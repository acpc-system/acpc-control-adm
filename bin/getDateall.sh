#!/bin/bash
### Script gets the date for each host
### 1st parameter is starting host, 2nd ending host
if [ $# -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
START="${1}"
END="${2}"
for i in $(seq ${START} ${END})
do
TEAM="team${i}"
echo -n "${TEAM} :"
DATE=$(ssh root@${TEAM} "date")
echo ${DATE} 
done
