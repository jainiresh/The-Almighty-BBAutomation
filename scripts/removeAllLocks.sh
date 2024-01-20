#!/bin/bash

directory="/home/jai/Documents/automations/programs"

if [ -d "$directory" ]; then
    find "$directory" -type f -name "lockfile" -exec rm -f {} \;
    echo "Removed 'lockfile' from all subdirectories in $directory."
else
    echo "Directory $directory does not exist."
fi
