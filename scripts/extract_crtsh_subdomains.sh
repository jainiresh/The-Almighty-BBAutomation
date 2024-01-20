#!/bin/bash

# Check if an argument is provided for the domain
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

# Get the input domain from the command line argument
domain="$1"

# URL to fetch subdomains from
url="https://crt.sh/?q=$domain"

# Use curl to fetch the page content and grep with a regex to extract subdomains
subdomains=$(curl -s "$url" | grep -Eo "[-a-zA-Z0-9]+\.$domain")

# Remove duplicates and sort the subdomains
unique_subdomains=$(echo "$subdomains" | sort -u)

# Remove the leading dot (.) from subdomains and save to crtshSubs.txt
echo "$unique_subdomains" | sed 's/^\.\(.*\)/\1/' > crtshSubs.txt

echo "Subdomains extracted and saved to crtshSubs.txt"

