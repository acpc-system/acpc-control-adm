for i in {1019..1019}
do
	ssh root@team$i "usermod -p `openssl passwd -6 BlU3T3@m` administrator" && echo "done team$i"
done
