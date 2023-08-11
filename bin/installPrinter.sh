#!/bin/bash
## Script stops the presentation
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
TEAM="team${i}"
echo -n "Install at ${TEAM} "
ssh root@${TEAM} "lpadmin -p 'printer' -E -v ipp://print1:631/printers/HP-LaserJet-400-M401d  -L '
ECPC Halls' -m everywhere"
echo " done"

done
exit 0
