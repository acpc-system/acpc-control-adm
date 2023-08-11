#!/bin/bash
### Script, validates the binaries in desktop shortcuts
### Accepts, Start team N, and End Team N
## Exit codes
##	0:  Success
##	1: Not enough parameters
[ ${#} -ne 2 ] && echo "Not enough parameters" && exit 1

function checkBinary () {
        TEAM=${1}
	BIN=${2}
        RES=$(ssh -o StrictHostKeyChecking=no root@${TEAM} "[ ! -f ${BIN} ] && echo 'error'  || echo 'done' " )
        echo ${RES}
}


function checkAll () {
	local CODE=0
	TEAM=${1}
	#RES=$(checkBinary ${TEAM} /usr/local/clion/bin/clion.sh)
	#[ ${RES} == "error" ] && echo -n "No CLion," && CODE=1
	#RES=$(checkBinary ${TEAM} /usr/bin/codeblocks)
        #[ ${RES} == "error" ] && echo -n "No Codeblocks," && CODE=1
	#RES=$(checkBinary ${TEAM} /usr/local/eclipse/eclipse)
        #[ ${RES} == "error" ] && echo -n "No Eclipse," && CODE=1
	#RES=$(checkBinary ${TEAM} /usr/local/idea-IC/bin/idea.sh)
        #[ ${RES} == "error" ] && echo -n "No IntelliJ," && CODE=1
	#RES=$(checkBinary ${TEAM} /usr/local/idea-IC/bin/idea.sh)
        #[ ${RES} == "error" ] && echo -n "No IntelliJ," && CODE=1
	#RES=$(checkBinary ${TEAM} /usr/local/pycharm/bin/pycharm.sh)
        #[ ${RES} == "error" ] && echo -n "No PyCharm," && CODE=1
	RES=$(checkBinary ${TEAM} /usr/bin/code)
        [ ${RES} == "error" ] && echo -n "No VSCode," && CODE=1
	[ ${CODE} -eq 0 ] && echo "All good" || echo ""
}

START=${1}
END=${2}
for i in $(seq ${START} ${END}) 
do
	TEAM="team${i}"
	echo -n "Checkig host ${TEAM} .. "
	#scp checkSingleHost.sh root@${TEAM}:/tmp
	#RES=$(ssh root@${TEAM} "chmod a+x /tmp/checkSingleHost.sh ; /tmp/checkSingleHost.sh")
	checkAll ${TEAM}
done
exit 0

