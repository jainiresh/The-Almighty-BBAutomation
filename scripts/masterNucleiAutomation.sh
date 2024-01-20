#!/bin/bash

input_file="/home/jai/Documents/automations/nucleiInputDomains.txt"
log_file="/home/jai/Documents/automations/nucleiScriptLogs.txt"
programs_dir="/home/jai/Documents/automations/programs"
nuclei_enum_script="/home/jai/Documents/automations/scripts/nucleiEnumeration.sh"
residue_dir="/home/jai/Documents/automations/residueFiles/nucleiAutomation"
lockfile="/tmp/nuclei.lock"
completed_file="/home/jai/Documents/automations/completed_nuclei_domains.txt"
nuclei_input="/home/jai/Documents/automations/nucleiInputDomains.txt"


# Initialize a flag to remove the lock file
remove_lock=true

# Function to remove the lock file
remove_lock_file() {
    if [ "$remove_lock" = true ]; then
        rm -f "$lockfile"
    fi
}

# Set up a trap to remove the lock file on script exit
trap "remove_lock_file" EXIT

# Check if a lock file exists
if [ -f "$lockfile" ]; then
    echo "$(date) Nuclei Script is already running. Exiting."
    echo "$(date) Nuclei Script is already running. Exiting." >> "$log_file"
    remove_lock=false
    exit 1
fi

# Create a lock file
touch "$lockfile"

# Check if inputDomains.txt does not exists
if [ ! -f "$input_file" ]; then
    echo "$(date) Nuclei input text not found"
    echo "$(date) Nuclei input text not found" >> "$log_file"
    exit 1
fi

# Check if inputDomains.txt is empty
if [ ! -s "$input_file" ]; then
    echo "$(date) No new domains found on Nuclei input file"
    echo "$(date) No new domains found on Nuclei input file" >> "$log_file"
    exit 1
fi

echo "Cleaning up the residue files in case if present "
cd /home/jai/nucleiPlayground
mv *.txt "$residue_dir"

# Process the first domain in inputDomains.txt
if IFS= read -r domain < "$input_file"; then
    # Check if the folder with the same name as the domain exists in programs_dir
    if [ -d "$programs_dir/$domain" ]; then
    	if [ -f "$programs_dir/$domain/nuclei.txt" ];then
    		rm "$programs_dir/$domain/nuclei.txt"
    		echo "Removed already present nuclei.txt in $domain" >> $log_file	
    	fi
    	# Run nucleiEnumeration.sh with the domain as input
        if "$nuclei_enum_script" "$programs_dir/$domain/unique_subs.txt"; then
            # If the script runs successfully
	    mv *.txt "$programs_dir/$domain"
	    
            # Remove the domain name from inputDomains.txt
            sed -i "/^$domain$/d" "$input_file"
           
            echo "$(date) Nuclei enumerated and completed for - $domain"
            echo "$(date) Nuclei enumerated and completed for - $domain" >> "$log_file"
            # Adding the domain to completed file
            echo "$domain" >> "$completed_file"
	    echo "Nuclei enumertaed for $domain" | /usr/local/bin/notify -p telegram
        else
            # If the script exits without successful completion
            echo "$(date) nucleiEnumeration.sh file failed to complete"
            echo "$(date) nucleiEnumeration.sh file failed to complete" >> "$log_file"
        fi
    else
         # Remove the domain name from inputDomains.txt
        sed -i "/^$domain$/d" "$input_file"
        echo "$(date) Domain folder not created , subs not enumerated! - $domain"
        echo "$(date) Domain folder not created , subs not enumerated! - $domain" >> "$log_file"
    fi
fi


# Remove the lock file when the script is done
remove_lock_file
