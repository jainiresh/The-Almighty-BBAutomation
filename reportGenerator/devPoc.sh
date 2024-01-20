#!/bin/bash

# Check if the file path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_with_ip_addresses>"
    exit 1
fi

# File containing IP addresses, passed as argument
ip_file=$1

# Loop through each IP address in the file
while IFS= read -r ip; do
    # Make a curl request to the endpoint with the -k flag
    response=$(curl -ks "https://$ip/api/session/properties")

    # Check if the request was successful (HTTP status code 200)
    if [ $? -eq 0 ]; then
        # Extract the setup-token from the JSON response
        setup_token=$(echo "$response" | jq -r '.["setup-token"]')

        # Print IP address and setup token
        echo "IP: $ip, Setup Token: $setup_token"
    else
        # Print an error message if the request was not successful
        echo "Failed to retrieve setup token for IP: $ip"
    fi
done < "$ip_file"

