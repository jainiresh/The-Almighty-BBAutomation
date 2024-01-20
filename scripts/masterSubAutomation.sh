#!/bin/bash

input_file="/home/jai/Documents/automations/inputDomains.txt"
log_file="/home/jai/Documents/automations/scriptLogs.txt"
programs_dir="/home/jai/Documents/automations/programs"
sub_enum_script="/home/jai/Documents/automations/scripts/subEnumeration.sh"
residue_dir="/home/jai/Documents/automations/residueFiles"
lockfile="/tmp/script.lock"
completed_file="/home/jai/Documents/automations/completed_subenum_domains.txt"
eyewitness="/home/jai/tools/EyeWitness/Python/EyeWitness.py"
nuclei_input="/home/jai/Documents/automations/nucleiInputDomains.txt"
nMapAutomator_input_file="/home/jai/Documents/automations/nMapAutomator_input_queue.txt"

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
    echo "$(date) Script is already running. Exiting."
    echo "$(date) Script is already running. Exiting." >> "$log_file"
    remove_lock=false
    exit 1
fi

# Create a lock file
touch "$lockfile"

# Check if inputDomains.txt exists
if [ ! -f "$input_file" ]; then
    echo "$(date) input text not found"
    echo "$(date) input text not found" >> "$log_file"
    exit 1
fi

# Check if inputDomains.txt is empty
if [ ! -s "$input_file" ]; then
    echo "$(date) No new domains found"
    echo "$(date) No new domains found" >> "$log_file"
    exit 1
fi

echo "Cleaning up the residue files in case if present "
cd /home/jai
mv *.txt "$residue_dir"

# Process the first domain in inputDomains.txt
if IFS= read -r domain < "$input_file"; then
    # Check if the folder with the same name as the domain exists in programs_dir
    if [ -d "$programs_dir/$domain" ]; then
        # Remove the domain name from inputDomains.txt
        sed -i "/^$domain$/d" "$input_file"
        echo "$(date) Domain folder already present - $domain"
        echo "$(date) Domain folder already present - $domain" >> "$log_file"
    else
        # Run subEnumeration.sh with the domain as input
        if "$sub_enum_script" "$domain"; then
            # If the script runs successfully
            mkdir -p "$programs_dir/$domain"
	    mv *.txt "$programs_dir/$domain"
	    
	    # Eyewitnessing it
	    "$eyewitness" -f "$programs_dir/$domain/unique_subs.txt" -d "$programs_dir/$domain/Eyewitness"
	    
            # Remove the domain name from inputDomains.txt
            sed -i "/^$domain$/d" "$input_file"
            
            # Domain input to nuclei input file
           # echo "$domain" >> $nuclei_input
            
            echo "$(date) Sub enumerated and completed for - $domain"
            echo "$(date) Sub enumerated and completed for - $domain" >> "$log_file"
            # Adding the domain to completed file
            echo "$domain" >> "$completed_file"
	    echo "Subs enumertaed for $domain" | /usr/local/bin/notify -p telegram
        else
            # If the script exits without successful completion
            echo "$(date) subEnumeration.sh file failed to complete"
            echo "$(date) subEnumeration.sh file failed to complete" >> "$log_file"
        fi
    fi
fi


# Remove the lock file when the script is done
remove_lock_file

