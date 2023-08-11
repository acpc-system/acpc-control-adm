#!/bin/bash
##Used to start PC2 on teams
## Accept two parameters, 
##	1st : starting teamn
##	2nd : last teamn
[ ${#} -ne 2 ] && echo "Not enough parameters" && exit 1
START=${1}
END=${2}
for i in $(seq ${START} ${END})
do 
	HOST="team${i}"
	echo -n "Stopping at ${HOST} .. " 
	ssh root@${HOST} "pkill -9 pc2 ; pkill -9 java"
	echo " .. done"
done
