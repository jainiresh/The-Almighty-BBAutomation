#!/bin/bash

log_file="/home/jai/Documents/automations/scriptLogs.txt"
dangCnameTemplate="/home/jai/Documents/automations/scripts/detect-dangling-cname.yaml"

# Function to check if text files exist
check_text_files_exist() {
    if ls *.txt 1> /dev/null 2>&1; then
    	#debug
    	#echo "Current directory is $(pwd)" >> "$log_file"
        return 0  # Files exist
    else
        return 1  # Files do not exist
    fi
}

# Check if a domain name argument is provided
if [ -n "$1" ]; then
    domain="$1"
    echo "Enumerating subs for domain: $domain"
else
    # Prompt the user for the domain
    read -p "Enter your domain: " domain
    echo "Enumerating subs for domain: $domain"
fi

# Check if text files from the previous run exist
if check_text_files_exist; then
    echo "Text files from the previous run exist. Skipping enumeration." >> "$log_file"
    exit 1
else
    # Run various subdomain enumeration tools
    subfinder -d "$domain" -all -o subfinder.txt
    python3 /home/jai/tools/Sublist3r/sublist3r.py -d "$domain" -e baidu,yahoo,google,bing,ask,netcraft,threatcrowd,ssl,passivedns -o sublist3r.txt
    assetfinder -subs-only "$domain" | tee -a assetfinder.txt
    curl -s "https://otx.alienvault.com/api/v1/indicators/domain/$domain/passive_dns" | jq -r ".passive_dns[].hostname" | sort | uniq  > alienVault.txt
    
    /home/jai/Documents/automations/scripts/extract_crtsh_subdomains.sh $domain
    

    # Combine and deduplicate the results from this script
    cat *.txt | sort -u > unique_subs.txt
    
    cat unique_subs.txt | xargs -I {} sh -c 'dig +short {} | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"' | sort | uniq > ip_addresses.txt
	
    # Check the response status code for each subdomain
    /usr/local/bin/httpx -silent -sc -fr -cname -cl -list unique_subs.txt -o subsStatus.txt

    /usr/local/bin/nuclei -list unique_subs.txt -t "$dangCnameTemplate" -o danglingCnames.txt
   
    if [ -s "danglingCnames.txt" ] && [ $(wc -c <  "danglingCnames.txt") -gt 2 ]; then
	echo "$(date) Found dangling Cname : on main domain $domain" >> $lof_file
	echo "Found dangling cnames, they are : " | /usr/local/bin/notify -p telegram
	/usr/local/bin/notify -p telegram -i danglingCnames.txt
    fi   
    echo "Subdomain enumeration completed."
fi

