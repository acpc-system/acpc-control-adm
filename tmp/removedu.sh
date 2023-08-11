#!/bin/bash

# Initialize an associative array to store unique MAC addresses
declare -A mac_addresses

# Input file containing MAC addresses
mac_file="/acpc/adm/tmp/macs"

# Check if the file exists and is readable
if [ ! -r "$mac_file" ]; then
    echo "Error: $mac_file does not exist or is not readable."
    exit 1
fi

# Read MAC addresses from the file and populate the associative array
while IFS= read -r mac; do
    # Remove any ':' or '-' characters from the MAC address
    mac_clean=${mac//[:\-]/}

    # Check if the MAC address is not empty and add it to the associative array
    if [[ -n $mac_clean ]]; then
        mac_addresses[$mac_clean]=1
    fi
done < "$mac_file"

# Output the unique MAC addresses
for unique_mac in "${!mac_addresses[@]}"; do
    # Insert ':' after every 2 characters in the MAC address for formatting
    formatted_mac=$(sed 's/.\{2\}/&:/g; s/:$//' <<< "$unique_mac")
    echo "$formatted_mac"
done
