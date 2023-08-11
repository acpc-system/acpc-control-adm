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
echo -n "Adding printer ${TEAM} "
#ssh root@${TEAM} "lpadmin -p 'printer' -E -v ipp://print1:631/printers/HP-LaserJet-400-M401a-2 -L 'ECPC Halls' -m everywhere"
ssh root@${TEAM} "lpadmin -p 'printer' -E -v ipp://print2:631/printers/Hewlett-Packard-HP-LaserJet-400-M401a -L 'ECPC Halls' -m everywhere"
echo " done"

done
exit 0
