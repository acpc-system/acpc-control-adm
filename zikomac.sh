#!/bin/bash

# Set the path to the DHCP leases file
leases_file="/var/lib/dhcp/dhcpd.leases"

# Set the output file path
output_file="/tmp/zikomac.txt"

# Check if the DHCP leases file exists
if [ ! -f "$leases_file" ]; then
  echo "Error: DHCP leases file not found."
  exit 1
fi

# Extract MAC addresses and save to the output file
awk '/^lease/ {ip=$2} /^  hardware ethernet/ {mac=$3; gsub(";", "", mac); print mac}' "$leases_file" > "$output_file"

echo "MAC addresses extracted and saved to $output_file"
