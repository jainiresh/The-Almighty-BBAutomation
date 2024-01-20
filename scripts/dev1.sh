#!/bin/bash

automationsDir="/home/jai/Documents/automations"
dir="$automationsDir/subdomainMonitors"
programDir="$dir/programs"
scriptDir="$automationsDir/scripts"
input="$automationsDir/subMonitorInput.txt"
logFile="$automationsDir/scriptLogs/subMonitorLogs.txt"
subMonitorScript="$scriptDir/subMonitor.sh"


if [ ! -f "$input" ]; then
	echo "$(date) input file not found !" >> "$logFile"
	exit 1
fi

if [ $(wc -c < $input) -le 1 ]; then
	echo "Insufficient input found on file : $input"
	exit 1
fi


while IFS= read -r domain ; do
	#skip the empty new lines or spaces
	if [ ! ${#domain} -gt 2 ]; then
		continue
	fi
	
	#check if that program's dir is present, and creating if not present
	if [ ! -d "$programDir/$domain" ]; then 
		mkdir "$programDir/$domain"
		echo "Created new first directory $domain"
	fi
	
	#Removing already present Nall.txt if found
	if [ -f "$scriptDir/vaultFiles/Nall.txt" ]; then
		rm "$scriptDir/vaultFiles/Nall.txt"
		echo "Removed present Nall.txt file"
	fi
	
	#Invoking subMonitorScript to fetch new subs, that gets stored at automations dir > scripts > vaultFiles (Nall.txt)
	"$subMonitorScript" "$domain"
	
	if [ ! -f "$scriptDir/vaultFiles/Nall.txt" ]; then
		echo "New subs file not found at $scriptDir/vaultFiles/Nall.txt"
		continue
	fi
	
	#Check if Nall.txt is already present on the programDir
	if [ -f "$programDir/$domain/Nall.txt" ]; then
		rm "$programDir/$domain/Nall.txt"
		echo "Removed inside Dir Nall.txt for $domain"
	fi
	
	#Moving the current domain's Nall.txt to it's appropriate directory
	mv "$scriptDir/vaultFiles/Nall.txt" "$programDir/$domain"
	
	#Current.txt is not present or empty file
	if [ ! -f "$programDir/$domain/current.txt" ] || [ $(wc -c < "$programDir/$domain/current.txt") -le 1 ]; then
		echo "First time subs for $domain"
		mv "$programDir/$domain/Nall.txt" "$programDir/$domain/current.txt"
		touch "$programDir/$domain/gold.txt"
	else
		#Current.txt is already present and full of contents
		
		gold=$(cat "$programDir/$domain/Nall.txt" | anew "$programDir/$domain/current.txt")
		
		gold_length=${#gold}
		
		if [ "$gold_length" -gt 1 ];then
			echo "Gold found for $domain of length $gold_length and gold : $gold"
			echo "$gold" >> "$programDir/$domain/gold.txt"
			mv "$programDir/$domain/Nall.txt" "$programDir/$domain/current.txt"
			# {{Trigger Alert for gold}}
			
			echo "$gold" | notify -p telegram
		else
			echo "No gold found for $domain"
			rm "$programDir/$domain/Nall.txt"
		fi
	fi
	
		
done < $input



