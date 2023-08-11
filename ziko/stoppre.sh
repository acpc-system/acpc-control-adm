for i in {1001..1148}
do
	ssh root@team$i "userdel view"
done
