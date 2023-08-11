#!/bin/bash

for i in $( seq $1 $2 ) 
do 
TEAM="team{i}"

ssh root@${TEAM} 

