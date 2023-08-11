#!/bin/bash
## Script fix ziko's shit on .config
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
TEAM="team${i}"
echo -n "Working at ${TEAM} "
ssh root@${TEAM} "rm -Rf /home/${TEAM}/.config ; sudo cp -R /usr/src/team-home/.config/ /home/${TEAM}; chown -R ${TEAM} /home/${TEAM}/.config"
echo " done"
done
exit 0
