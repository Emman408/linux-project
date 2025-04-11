#!/usr/bin/env bash

LOG_FILE="/var/log/system_maintenance.log"

echo "========= Starting System Maintenance: $(date) =========" >> $LOG_FILE

# Update packages
echo "Updating packages..." >> $LOG_FILE

# For Ubuntu/Debian:
sudo apt update -y && sudo apt upgrade -y >> $LOG_FILE 2>&1

# Remove old log files older than 7 days
echo "Removing old log files..." >> $LOG_FILE
sudo find /var/log -type f -name "*.log" -mtime +7 -exec rm {} \; >> $LOG_FILE 2>&1

# Check disk usage
echo "Disk Usage Info:" >> $LOG_FILE
df -h >> $LOG_FILE

# Check for failed SSH login attempts
echo "Failed SSH attempts:" >> $LOG_FILE
grep "Failed password" /var/log/auth.log >> $LOG_FILE 2>/dev/null

echo "========= Maintenance Completed: $(date) =========" >> $LOG_FILE
echo "" >> $LOG_FILE
