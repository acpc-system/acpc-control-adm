#!/bin/bash
###soft coded to add apps to favourite

for i in $(seq $1 $2) 
  do 
    TEAM=team$i 
    scp /acpc/prog/common/teams-desktop-entry/*.desktop root@$TEAM:/home/$TEAM/.local/share/applications
    ssh root@$TEAM   "sudo -u $TEAM dbus-launch  rm /home/$TEAM/.local/share/applications/intellij.desktop  /home/$TEAM/.local/share/applications/ScoreBoard.desktop  /home/$TEAM/.local/share/applications/STL_Documentation.desktop   /home/$TEAM/.local/share/applications/Calculator.desktop"
        echo "working with $TEAM"
        oFILES=$(ssh root@$TEAM "cd /home/$TEAM/.local/share/applications ; ls -l *.desktop ")
        FILES=$(echo "${oFILES}" | awk ' { print $9 } ') 
        CMD="" 
        CO=1 
        for i in ${FILES} 
          do 
            #echo "Working with ${i}" 
            #echo "done"
             if [ ${CO} -eq 1 ] 
             then
               CMD="'${i}'" CO=2 
             else 
               CMD="${CMD},'${i}'"
             fi 

          done
        if [ $? -eq 0 ]; then
          echo "$TEAM done"
        else
          echo "$TEAM dead"
        fi
        CMD="\"[${CMD}]\""
        #echo "${CMD}" 
        #ssh root@$TEAM "sudo -u $TEAM dbus-launch  dconf write /org/gnome/shell/favorite-apps ${CMD}  ;  killall -SIGQUIT gnome-shell "
        #ssh root@$TEAM "sudo -u $TEAM dbus-launch gsettings set org.gnome.shell favorite-apps ${CMD} ; killall -HUP gnome-shell"
        ssh root@$TEAM "sudo -u $TEAM dbus-launch gsettings set org.gnome.shell favorite-apps ${CMD} "
        ssh root@$TEAM "sudo systemctl restart gdm"
  done
##--------------------------------------------------------------------------------------------------------------------------------------------

