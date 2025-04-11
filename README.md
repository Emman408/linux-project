This Bash script automates a few key system maintenance tasks on an Ubuntu/Debian-based Linux server and saves the results to /var/log/system_maintenance.log. Specifically, it:

Updates Software Packages

Runs apt update and apt upgrade to download and apply any available software/package updates.

Removes Old Log Files

Uses find to locate and delete any .log files in /var/log older than 7 days, helping control disk space usage.

Checks Disk Usage

Captures the output of df -h to display how much space is used, available, and the usage percentage on each mounted filesystem.

Checks for Failed SSH Logins

Searches /var/log/auth.log for any occurrences of “Failed password,” revealing unsuccessful login attempts that may indicate potential unauthorized access attempts.

Logs All Actions

Writes each step’s information to a dedicated log file, /var/log/system_maintenance.log, making it easy to review what was done and when it was done.
