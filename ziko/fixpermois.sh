for i in {1001..1148}
do
	ssh root@team$i "chown -R team$i:team$i /home/team$i && chown -R team$i:team$i /home/team$i/.config"
done
