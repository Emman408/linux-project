#!/usr/bin/env bash

LOG="/var/log/health_check.log"
THRESHOLD_CPU=80     # percent
THRESHOLD_DISK=90    # percent on /
EMAIL="you@yourdomain.com"

echo "===== Health Check: $(date) =====" >> "$LOG"

# 1) Uptime
echo "Uptime:" >> "$LOG"
uptime >> "$LOG"

# 2) CPU & Memory usage
echo "CPU & Memory:" >> "$LOG"
top -b -n1 | head -n 10 >> "$LOG"

# 3) Disk usage
echo "Disk Usage:" >> "$LOG"
df -h >> "$LOG"

# 4) Recent logins
echo "Recent Logins:" >> "$LOG"
last -n 5 >> "$LOG"

echo "" >> "$LOG"

# Optional alerts
# CPU alert
CPU_LOAD=$(top -b -n1 | grep "Cpu(s)" | \
    awk -F'id,' '{ split($1, u, ","); print 100 - u[2] }' | cut -d. -f1)
if [ "$CPU_LOAD" -gt "$THRESHOLD_CPU" ]; then
  echo "CPU load is ${CPU_LOAD}% (> ${THRESHOLD_CPU}%)" | mail -s "CPU Alert on $(hostname)" "$EMAIL"
fi

# Disk alert
DISK_USE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$DISK_USE" -gt "$THRESHOLD_DISK" ]; then
  echo "Root partition usage is ${DISK_USE}% (> ${THRESHOLD_DISK}%)" | \
    mail -s "Disk Alert on $(hostname)" "$EMAIL"
fi
