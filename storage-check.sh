#!/bin/bash

# Ensure script is run as root

if [[ $EUID -ne 0 ]]; then
	echo "Error: This script must be run as root!" >&2
	exit 1
fi

LOG_FILE="/var/log/storage_report.txt"

#Start logging

echo "-----------------------------------" >> $LOG_FILE
echo "Storage Check Report $(date)" >> $LOG_FILE
echo "-----------------------------------" >> $LOG_FILE

#Define partition to monitor
PARTITION="/dev/sde"

#Exract disk usage percentage

DISK_USAGE=$(df -h | grep "$PARTITION" | awk '{print $5}' | tr -d %)

#Define disk space threshold
CRITICAL_THRESHOLD=90
WARNING_THRESHOLD=50

if [[ $DISK_USAGE -ge $CRITICAL_THRESHOLD ]]; then
	echo "[CRITICAL] Disk usage is at $DISK_USAGE%! Immediate action required!" | tee -a $LOG_FILE
elif [[ $DISK_USAGE -ge $WARNING_THRESHOLD ]]; then
	echo "[WARNING] Disk usage is at $DISK_USAGE%! Consider frreing some space!" | tee -a $LOG_FILE
else
	echo "[OK] Disk usage is at $DISK_USAGE%!. No action required" | tee -a $LOG_FILE
fi

# This script will handle errors

if [[ -z "$DISK_USAGE" ]]; then
	echo "[ERROR] unable to retreive disk usage. Please check your partition setting. " | tee -a $LOG_FILE
	exit 1
fi


