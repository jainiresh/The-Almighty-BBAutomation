#!/bin/bash


log_file="/home/jai/Documents/automations/scriptLogs/nMapAutomatorLogs.txt"
nMap_enum_script="nmapAutomator.sh"

# Check if the correct number of arguments are provided
if [ $# -ne 1 ]; then
    echo "$(date) Usage: Incorrect arguments given" >> "$log_file"
    exit 1
fi

# Path to the IP addresses file
ip_addresses_file="$1/ip_addresses.txt"
domain_dir="$1"

#DEBUG
echo "Printing received_ip_addressess file : $ip_addresses_file"

# Check if the ip_addresses.txt file exists
if [ ! -f "$ip_addresses_file" ]; then
    echo "ip_addresses.txt file not found."
    exit 1
fi


# DEBUG
echo "domain dir : $domain_dir"
if [ -d $domain_dir ]; then
	echo "Dir present"
else
	echo "Not present"
fi

# Path for NMapEnumerations directory
output_directory="$domain_dir/nMapEnumerations"

# Clear if any already present
rm -rf $output_directory

# Loop through each IP address in ip_addresses.txt and run nmapAutomator.sh
while read -r target_ip; do
    if [ -n "$target_ip" ]; then
        # Run nmapAutomator.sh for each IP
        echo "$(date) NMapEnumeration started for $target_ip" >> "$log_file"
        sudo "$nMap_enum_script" "$target_ip" Full -o "$output_directory"
        echo "$(date) NMapEnumeration completed for $target_ip" >> "$log_file"
    fi
done < "$ip_addresses_file"

# Exit with status 0 when all IP addresses have been processed
exit 0

