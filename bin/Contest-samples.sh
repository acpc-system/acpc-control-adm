#!/bin/bash
if [ -d /contest-samples ]
then
        rm -Rf /contest-samples/*
fi

scp -r root@judge1:/home/judge1/Desktop/samples/* /contest-samples/ >> /dev/null

for i in $( seq $1 $2 ) 
do 
TEAM="team${i}"
echo "Publishing on ${TEAM}"
ssh root@${TEAM} "rm -r /home/${TEAM}/Desktop/samples/*"
scp -r /contest-samples/* root@${TEAM}:/home/${TEAM}/Desktop/samples/ >> /dev/null
ssh root@${TEAM} "chmod a+x /home/${TEAM}/Desktop/samples"
done
