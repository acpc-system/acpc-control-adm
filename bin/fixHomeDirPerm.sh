#!/bin/bash
mkdir /usr/src/team-home
cd /usr/src/team-home
tar -xzf /usr/src/home-team.tar.gz
mv team2 $(hostname)
cd $(hostname)
find . -type f -exec sed -i  's/\/home\/administrator\//~\//g' {} \;
