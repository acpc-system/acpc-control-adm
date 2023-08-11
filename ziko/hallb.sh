for i in `seq 2001  2096`
do
#ssh root@judge$i "chown -R judge$i:judges /home/judge$i/*"
ssh root@team$i "chown -R team$i:team$i /home/team$i"
#ssh root@team$i "chmod a+x /usr/local/pc2/bin/pc2team"
done
