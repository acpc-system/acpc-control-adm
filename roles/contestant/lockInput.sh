#!/bin/bash
## Script that search for keyboard event # and mount event #

function getEvent () {
	for WORD in ${@}
	do
		[ $(echo "${WORD}" | grep -c "event") -ne 0 ] && echo "${WORD}" && return 0
	done
	return 1
}


INFO=$(cat /proc/bus/input/devices)
KBLN=$(echo "${INFO}" | grep -n "Wired Keyboard\"" | cut -d":" -f1)
MSLN=$(echo "${INFO}" | grep -n "Optical Mouse\"" | cut -d":" -f1)

MOUSELINES=$(echo "${INFO}" | tail -n +${MSLN} | grep "Handlers="| head -1)
KEYBOARDLINES=$(echo "${INFO}" | tail -n +${KBLN} | grep "Handlers="| head -1)
MOUSEHDLR=$(getEvent ${MOUSELINES})
KEYBOARDHDLR=$(getEvent ${KEYBOARDLINES})
echo "Mouse handler : ${MOUSEHDLR}"
echo "Keyboard handler : ${KEYBOARDHDLR}"

nohup evtest --grab /dev/input/${MOUSEHDLR} &
nohup evtest --grab /dev/input/${KEYBOARDHDLR} &
