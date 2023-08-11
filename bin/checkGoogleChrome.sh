#!/bin/bash
## Script check for google chrome
if [ ${#} -ne 2 ]
then
	echo "Invalid parameters"
	exit 1
fi
for i in $(seq ${1} ${2})
do
TEAM="team${i}"
echo -n "Checking google chrome at ${TEAM} "
RES=$(ssh root@${TEAM} "which google-chrome")
if [ ! -z ${RES} ]
then
	echo " installed"
else
	echo " not installed"
fi
done
exit 0
