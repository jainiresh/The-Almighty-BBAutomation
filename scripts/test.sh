#!/bin/bash

log_file="/home/jai/Documents/automations/scriptLogs.txt"

echo "Starting test script httpx" >> $log_file
/usr/local/bin/httpx -list unique_subs.txt -cname -fr -cl -o subStatus.txt
echo "Ended script test" >> $log_file
