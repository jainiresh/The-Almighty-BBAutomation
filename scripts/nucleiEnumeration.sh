#!/bin/bash

log_file="/home/jai/Documents/automations/nucleiScriptLogs.txt"

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

# Check if a file name argument is provided
if [ -n "$1" ]; then
    file="$1"
    echo "Nuclei-ing subs for file: $file"
else
    # Prompt the user for the file
    read -p "Enter your file path: " file
    echo "Nucleing subs for file: $file"
fi

# Check if text files from the previous run exist
if check_text_files_exist; then
    echo "Text files from the previous run exist. Skipping enumeration." >> "$log_file"
    exit 1
else
    if [ ! -f $file ];then
    	echo "$(date) $file not found !" >> $log_file
    	exit 1
    fi
    # Running nuclei script on the input file
    /usr/local/bin/nuclei -list $file -o nuclei.txt
    
    if grep -q "low" nuclei.txt; then
	echo "Found low severity files! " | /usr/local/bin/notify -p telegram
	grep "low" nuclei.txt | /usr/local/bin/notify -p telegram
    else
	echo "No Low severity files found for $file" | /usr/local/bin/notify -p telegram
    fi
    
    
    if grep -q "medium" nuclei.txt; then
	echo "Found medium severity files! " | /usr/local/bin/notify -p telegram
	grep "medium" nuclei.txt | /usr/local/bin/notify -p telegram
    else
	echo "No Medium severity files found for $file" | /usr/local/bin/notify -p telegram
    fi
    
    
    if grep -q "high" nuclei.txt; then
	echo "Found high severity files! " | /usr/local/bin/notify -p telegram
	grep "high" nuclei.txt | /usr/local/bin/notify -p telegram
    else
	echo "No High severity files found for $file" | /usr/local/bin/notify -p telegram
    fi
    
    if grep -q "critical" nuclei.txt; then
	echo "Found critical severity files! " | /usr/local/bin/notify -p telegram
	grep "critical" nuclei.txt | /usr/local/bin/notify -p telegram
    else
	echo "No Critical severity files found for $file" | /usr/local/bin/notify -p telegram
    fi

    
    echo "Nuclei enumeration completed."
fi
