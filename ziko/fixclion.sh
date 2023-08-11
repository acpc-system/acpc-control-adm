for i in {1001..1148}

do
		ssh root@team$i "chattr -i /home/team$i/.config/JetBrains/CLion2022.3/config/clion.key"
done
