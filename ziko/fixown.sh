for i in {1001..1001}
do
	ssh root@team$i "smbios-token-ctl -i 0x00a2 --activate" && echo "done team$i""
done
