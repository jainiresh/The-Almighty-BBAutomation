#!/bin/bash

# Set the target directory to monitor
target_directory="/home/jai/Documents/test"

# Set the path to "Script O_R"
script_or="/home/jai/Documents/learning/bash_scripting/masterOpenRedirector.sh"

# Monitor the target directory for new subdirectories
inotifywait -m -e create --format "%w%f" "$target_directory" |
while read -r new_dir; do
    # Execute "Script O_R" when a new subdirectory is created
    "$script_or" "$new_dir"
done

