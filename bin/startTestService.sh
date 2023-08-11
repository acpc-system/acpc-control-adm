#!/bin/bash
##Used to start test on all teams
## Accept two parameters, 
##	1st : starting teamn
##	2nd : last teamn
[ ${#} -ne 2 ] && echo "Not enough parameters" && exit 1
START=${1}
END=${2}
for i in $(seq ${START} ${END})
do 
	HOST="team${i}"
	echo -n "Starting at ${HOST} .. " 
	ssh root@${HOST} "/test/startTest.sh /test/a.cpp"
	echo " .. done"
done
