# Linux Server Automation, Security & Monitoring

This repository contains all scripts and configuration files developed for the “Automating, Securing, and Managing a Linux Server for Enterprise Operations” project. Each top‑level folder corresponds to one of the project tasks.

## Repository Structure

- **[system_maintenance/](https://github.com/Emman408/linux-project/tree/main/system_maintenance)**  
  Task 1 – System Maintenance Script  
  - `system_maintenance.sh`: Bash script to update packages, clean old logs, check disk usage, and report failed SSH logins.  
  - `README.md`: Details on what the script does and how to run it.

- **[Task 2/](https://github.com/Emman408/linux-project/tree/main/Task%202)**  
  Task 2 – Scheduling Maintenance  
  - `cron_script`: crontab entry to run `system_maintenance.sh` daily at 03:00.  
  - `system_maintenance.service`: systemd unit for one‑off maintenance runs.  
  - `system_maintenance.timer`: systemd timer to fire the service daily at 03:00.

- **[Task 3 Remote/](https://github.com/Emman408/linux-project/tree/main/Task%203%20Remote)**  
  Task 3 – Local LVM + Remote NFS Backup  
  - `backup_script.sh`: Copies `/home/` to the NFS mount at `/mnt/backup`.

- **[task_4/](https://github.com/Emman408/linux-project/tree/main/task_4)**  
  Task 4 – Log Analysis & Forwarding  
  - `extract_logs.sh`: Extracts failed SSH logins, service failures, and reboots from remote logs.

- **[Task_5_nginx/](https://github.com/Emman408/linux-project/tree/main/Task_5_nginx)**  
  Task 5 – Service Deployment & Hardening  
  - `nginx.conf`: Main Nginx configuration file.  
  - **Firewall rules** captured in screenshots or as UFW/firewalld commands.

- **[Task 6/](https://github.com/Emman408/linux-project/tree/main/Task%206)**  
  Task 6 – Monitoring & Reporting  
  - `health_check.sh`: Generates a health report (uptime, CPU/memory, disk, recent logins) and optionally sends alerts.

- **[Extra_task/](https://github.com/Emman408/linux-project/tree/main/Extra_task)**  
  Option 1 – Internal Time Server (Chrony)  
  - `chrony.conf`: Chrony configuration allowing LAN clients to sync and enabling logging.

- **[bonus/](https://github.com/Emman408/linux-project/tree/main/bonus)**  
  Bonus Challenge – Containerization & SSH Hardening  
  - `docker.sh`: Script to install Docker CE and run a test container.  
  - `fail2ban.local`: fail2ban jail configuration to ban repeated SSH failures.

---

## How to Use

1. **Clone** the repo:  
   ```bash
   git clone https://github.com/Emman408/linux-project.git
   cd linux-project
