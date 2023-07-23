#!/bin/bash
#1-Kill

TEAM="team1"
#ssh root@${TEAM} "kill $(ps -ef|sed '$d' | grep cli|awk ' { print $2 } ');rm -R /home/${TEAM}/.config;"
ssh root@${TEAM} "rm -R /home/${TEAM}/.config"


