#!/bin/bash

outputDir="/home/jai/Documents/automations/scripts/vaultFiles"

if [ "$#" -ne 1 ]; then
	echo "Provide an argument"
	exit 1
fi

domain="$1"

if [ -f "$outputDir/subfinder.txt" ];then
	rm "$outputDir/subfinder.txt"
fi

if [ -f "$outputDir/alienVault.txt" ];then
	rm "$outputDir/alienVault.txt"
fi

subfinder -d "$domain" -all -o "$outputDir/subfinder.txt"
curl -s "https://otx.alienvault.com/api/v1/indicators/domain/$domain/passive_dns" | jq -r ".passive_dns[].hostname" | sort | uniq  > "$outputDir/alienVault.txt"

sort -u "$outputDir/subfinder.txt" "$outputDir/alienVault.txt" > "$outputDir/Nall.txt"
