#!/bin/bash

runningScript="/home/jai/Documents/automations/scripts/masterSubMonitor.sh"

# Set the path to the timestamp file
timestamp_file="/home/jai/Documents/automations/scriptLogs/run_once_every_24h_timestamp.txt"
logFile="/home/jai/Documents/automations/scriptLogs/subMonitorLogs.txt"

# Get the current timestamp
current_timestamp=$(date +%s)

# Check if the timestamp file exists
if [ -e "$timestamp_file" ]; then
    # Read the previous timestamp from the file
    previous_timestamp=$(cat "$timestamp_file")

    # Calculate the time difference in seconds
    time_difference=$((current_timestamp - previous_timestamp))

    # Check if the time difference is greater than or equal to 24 hours (86400 seconds)
    if [ "$time_difference" -ge 43200 ]; then
    	echo "$(date) Starting check !" >> $logFile
        # Your command to run
        $runningScript

        # Update the timestamp file with the current timestamp
        echo "$current_timestamp" > "$timestamp_file"
        echo "$(date) Completed Check" >> $logFile
    else
        echo "$(date) Not enough time has passed since the last run. Exiting." >> "$logFile"
    fi
else
    # If the timestamp file doesn't exist, create it and run the command
    echo "$current_timestamp" > "$timestamp_file"
    echo "Executing your command..."
fi

