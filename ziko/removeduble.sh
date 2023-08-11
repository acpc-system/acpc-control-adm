for i in {1001..1148}
do
	ssh root@team$i "rm /home/team$i/Desktop/*.desktop.?"
done
