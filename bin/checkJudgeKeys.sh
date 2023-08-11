#!/bin/bash
## Script copy /id_rsa.pub to authorized keys 
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
HOST="judge${i}"
echo -n "Working at ${HOST} "
ssh root@${HOST} " [ -f /home/${HOST}/.ssh/authorized_keys ] && echo ' .. exists' || echo ' .. not exists'"
done
exit 0
