for i in {2001..2096} 
do
   ssh root@team$i "rm /etc/acpcHostname && systemctl restart configProfile.service"
done
