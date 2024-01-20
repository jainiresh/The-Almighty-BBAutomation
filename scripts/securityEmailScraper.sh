#!/bin/bash

globalEmailFile="/home/jai/Documents/automations/scripts/vaultFiles/currentEmails.txt"
tempFiterFile="/home/jai/Documents/automations/scripts/vaultFiles/tempFilterFile.txt"
poolOfWords=("secure" "security" "bug" "research" "vdp" "bounty" "vapt" "privacy" "report" "responsible" "disclos" "vuln" "backend")

if [ "$#" -eq 0 ]; then
	echo "Provide an argument"
else
	if [ ! "$#" -eq 2 ]; then
		echo "Expected only two arguments"
	fi
fi

query="$1"
count="$2"

echo "Checking if email file is already present"
if [ ! -f "$globalEmailFile" ]; then
	echo "No file present creating one"
	touch "$globalEmailFile"
else
	echo "Email file present"
fi

echo "Performing google search based on your query to "$2" search results"

echo '' > "$globalEmailFile"

googler "$1" --count "$2" --json | jq -r ".[].url" | while read -r url; do
	#Perform a curl command
	echo "Curling "$url" ."
	#Getting the html content by curl
	html_content=$(curl -s "$url")
	
	#scraping the email addresses from the page
	emails=$( echo "$html_content" | grep -E -o "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" )
	
	echo "Scraped email : $emails"
	
	
	
	while IFS= read -r email; do
		if ! grep -q "$email" "$globalEmailFile"; then
			echo "$email" >> "$globalEmailFile"
			echo "Email added : "$email""
		fi
	done <<< "$emails"
done
	
echo "Final list of emails collected"
cat "$globalEmailFile"

echo "Filtering out unwanted emails and junk"

echo "" > "$tempFiterFile"

for word in "${poolOfWords[@]}"; do
	echo "$word - word"
	grep -i "$word" "$globalEmailFile" >> "$tempFiterFile"
done

mv "$tempFiterFile" "$globalEmailFile"
echo "Filtered out !"

cat "$globalEmailFile"

xclip -selection clipboard < "$globalEmailFile"
