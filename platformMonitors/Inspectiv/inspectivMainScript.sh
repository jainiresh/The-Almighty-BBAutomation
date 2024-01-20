#!/bin/bash

log_file="/home/jai/Documents/automations/platformMonitors/Inspectiv/inspectiv_scriptLogs.txt"
json_file="/home/jai/Documents/automations/platformMonitors/Inspectiv/inspectivPrograms.json"
emailScript="/home/jai/Documents/learning/bash_scripting/scripts/EmailSendingScript.sh"

# Define the API endpoint
endpoint="https://api.inspectiv.io/cesppa/api/programs/short-list/"

if [ ! -f "$log_file" ]; then
	touch "$log_file"
	echo "$(date) Log file created"
fi

# Send a GET request and capture the response
response=$(curl -s "$endpoint" -H 'Authorization: Token e9c4cb414876ffe1c65c3fd8e1fc574afe03ec52')

#DEBUG
# echo "curl -s "$endpoint" -H 'Authorization: Token e9c4cb414876ffe1c65c3fd8e1fc574afe03ec52'"

# Check if the response is empty or contains an error message
if [ -z "$response" ]; then
  # Log the error in scriptLogs.txt
  echo "$(date) No data or error response from the API - Inspectiv" >> $log_file
else
  # Extract the value of .pagination.nb_results from the response
  latest_program=$(echo "$response" | jq -r '.results[0].uuid')
  latest_program_title=$(echo "$response" | jq -r '.results[0].title')

  # Check if programs.json exists
  if [ -f "$json_file" ]; then
    # Read the existing content of programs.json
    existing_response=$(cat "$json_file")

    # Extract the value of .results[0].uuid from the existing response
    existing_latest_program=$(echo "$existing_response" | jq -r '.results[0].uuid')
    #DEBUG
    #echo "ex : $existing_latest_program"
    #echo "latest : $latest_program"

    # Compare the nb_results from the existing and new responses
    if [ "$existing_latest_program" == "$latest_program" ]; then
      #echo "The existing latest program value is the same as the latest program value in programs.json. Not saving the value."
      echo "$(date) No updates - Inspectiv" >> "$log_file"
    else
      # Save the new response to programs.json
      echo "$response" > "$json_file"
      echo "$(date) Changes found, therefore updated - $latest_program_title - Inspectiv" >> "$log_file"

      # Trigger EmailSendingScript.sh
      "$emailScript" "Inspectiv - Change detected : $latest_program_title"
    fi
  else
    # If programs.json doesn't exist, save the new response
    echo "$response" > "$json_file"

    # Trigger EmailSendingScript.sh
    "$emailScript" "Created Json File for Inspectiv"
  fi
fi

