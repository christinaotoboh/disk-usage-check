#!/bin/bash


#Get current date and time
DATE_TIME=$(date "+%Y-%m-%d %H:%M:%S")

#Log Separator
echo "==============================" >> Log_file
echo "system Report - $DATE_TIME" >> Log_file
echo "==============================" >> Log_file

#Get CPU Usage (Load average)

echo "CPU Load (1/5/15 min average):" >> Log_file
uptime  >> Log_file

#Get Memory usage

echo -e "\nMemory Usage:" >> Log_file

free -h | awk 'NR==1 || /Mem|Swap/ { printf " %-10s %-10s %-10s %-10s %-10s %-10s\\n", $1, $2, $3, $4, $5, $6 }' >> Log_file

# Get Disk usage
echo -e "\nDisk Usage:" >> Log_file
df -h --output=source,size,used,avail,pcent,target | tail -n +2 >> Log_file

echo -e "\n" >> Log_file  # Add a newline for better readability between entries
