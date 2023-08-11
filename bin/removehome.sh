for i in {2001..2096}
do
	ssh root@team$i "rm -Rf /home/team*" && echo "done team$i"
done
