#!/bin/bash
###### Pass the ip for destination host
function login {
DISPLAY=:0 xdotool type "baba123"
DISPLAY=:0 xdotool key Return
}

function minimizeWindow {
	DISPLAY=:0 xdotool windowminimize $(xdotool getactivewindow)
}
#DISPLAY=:0 xdotool mousemove 10 10

#this will delay the script the program for 5 seconds
#sleep 5s

#this will click at location 10 10
#DISPLAY=:0 xdotool click 1
if [ -z  ${1} ]
then
	echo "Invalid IP address"
	exit 1
fi
minimizeWindow
