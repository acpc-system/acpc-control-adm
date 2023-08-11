#!/bin/bash

for i in $( seq $1 $2 ) 
do 
TEAM="team${i}"
echo "Publishing on ${TEAM}"
ssh root@${TEAM} "rm /home/${TEAM}/Desktop/samples/*"
scp -r /prac-samples/* root@${TEAM}:/home/${TEAM}/Desktop/samples/ >> /dev/null
ssh root@${TEAM} "chmod a+x /home/${TEAM}/Desktop/samples"
done
