for i in {2001..2096}
do
	ssh root@team$i "rm /usr/src/home-team.tar.gz" && echo "done team$i"
done
