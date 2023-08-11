for i in {1001..1148}
do
	ssh root@team$i "pkill -9 java" && echo "done team$i"
done
