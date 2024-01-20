#!/bin/bash

input_file="/home/jai/Documents/automations/nMapAutomator_input_queue.txt"
log_file="/home/jai/Documents/automations/scriptLogs/nMapAutomatorLogs.txt"
programs_dir="/home/jai/Documents/automations/programs"
nmap_enum_script="/home/jai/Documents/automations/scripts/nMapAutomator.sh"
residue_dir="/home/jai/Documents/automations/residueFiles"
lockfile="/tmp/nmap_script.lock"

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



# Process the first domain in nMapAutomator_input_queue.txt
if IFS= read -r domain < "$input_file"; then
    # Check if the folder with the same name as the domain exists in programs_dir
    if [ ! -d "$programs_dir/$domain" ]; then
        echo "$(date) Something went wrong, domain directory is not present - $domain"
        echo "$(date)Something went wrong, domain directory is not present - $domain" >> "$log_file"
    else
    	full_programs_dir_path="$programs_dir/$domain"
        # Run nmap_enum_script.sh with the domain directory path as input
        if "$nmap_enum_script" "$full_programs_dir_path" ; then
        	sed -i "/^$domain$/d" "$input_file"
        	echo "$(date) nMapAutomator completed for the domain : $domain" >> "$log_file"
        else
        	echo "$(date) Failed to complete the nMapEnumeration for domain : $domain" >> "$log_file"
        fi
        
    fi
fi


# Remove the lock file when the script is done
remove_lock_file
