#!/bin/bash
START=${1}
END=${2}
for i in $(seq ${START} ${END})
do
TEAM="team${i}"
echo -n "Working with ${TEAM} .. "
scp fixHomeDirPerm.sh root@${TEAM}:/tmp
ssh root@${TEAM} "chmod a+x /tmp/fixHomeDirPerm.sh ; /tmp/fixHomeDirPerm.sh"
echo " .. done"
done
