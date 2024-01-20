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
	echo "inputFile for subdomain monitor not found" | notify -p telegram
	exit 1
fi

if [ $(wc -c < $input) -le 1 ]; then
	echo "Insufficient input found on file : $input" >> "$logFile"
	echo "inputFile empty" | notify -p telegram
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
	fi
	
	#Removing already present Nall.txt if found
	if [ -f "$scriptDir/vaultFiles/Nall.txt" ]; then
		rm "$scriptDir/vaultFiles/Nall.txt"
	fi
	
	#Invoking subMonitorScript to fetch new subs, that gets stored at automations dir > scripts > vaultFiles (Nall.txt)
	"$subMonitorScript" "$domain"
	
	if [ ! -f "$scriptDir/vaultFiles/Nall.txt" ]; then
		echo "New subs file not found at $scriptDir/vaultFiles/Nall.txt for domain $domain" >> "$logFile"
		continue
	fi
	
	#Check if Nall.txt is already present on the programDir
	if [ -f "$programDir/$domain/Nall.txt" ]; then
		rm "$programDir/$domain/Nall.txt"
		echo "Nall.txt not found on program dir at : $domain" >> "$logFile"
	fi
	
	#Moving the current domain's Nall.txt to it's appropriate directory
	mv "$scriptDir/vaultFiles/Nall.txt" "$programDir/$domain"
	
	#Current.txt is not present or empty file
	if [ ! -f "$programDir/$domain/current.txt" ] || [ $(wc -c < "$programDir/$domain/current.txt") -le 1 ]; then
		mv "$programDir/$domain/Nall.txt" "$programDir/$domain/current.txt"
		touch "$programDir/$domain/gold.txt"
		echo "current.txt not found or empty at $domain" >> "$logFile"
	else
		#Current.txt is already present and full of contents
		
		gold=$(cat "$programDir/$domain/Nall.txt" | anew "$programDir/$domain/current.txt")
		
		gold_length=${#gold}
		
		if [ "$gold_length" -gt 1 ];then
			echo "Gold found for $domain" >> "$logFile"
			echo "$gold" >> "$programDir/$domain/gold.txt"
			mv "$programDir/$domain/Nall.txt" "$programDir/$domain/current.txt"
			# {{Trigger Alert for gold}}
			
			echo "$gold" | notify -p telegram
		else
			echo "No gold found for $domain" >> "$logFile"
			rm "$programDir/$domain/Nall.txt"
		fi
	fi
	
		
done < $input



