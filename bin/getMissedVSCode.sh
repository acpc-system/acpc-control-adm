#!/bin/bash
## Script get PCs wth no vscode, or vscode ver less that 1.72
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
TEAM="team${i}"
echo -n "Working with ${TEAM} "
ssh root@${TEAM} ":w
:"
echo " done"

done
exit 0
