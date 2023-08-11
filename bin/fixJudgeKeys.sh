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
scp /id_rsa.pub root@${HOST}:/
ssh root@${HOST} "mkdir /home/${HOST}/.ssh 2>/dev/null;cp /id_rsa.pub /home/${HOST}/.ssh/authorized_keys;chown -R ${HOST} /home/${HOST}/.ssh"
#IDS=$(ssh root@${TEAM} "ps -ef|grep presentation | awk ' { print $2 }' | sed '$d'")
#ssh root@${TEAM} "kill $(ps -ef|grep presentation | awk ' { print $2 }' | sed '$d')"
echo " done"

done
exit 0
