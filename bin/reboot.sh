for i in $(seq 4 10)
do
	ssh root@judge$i "reboot"
done
