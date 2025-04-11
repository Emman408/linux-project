cat <<'EOF' > /usr/local/bin/backup_logs.sh
#!/usr/bin/env bash
LOG="/var/log/backup_logs.log"
echo "===== Backup started: $(date) =====" >> $LOG

rsync -av /home/ /mnt/backup/ >> $LOG 2>&1

echo "===== Backup completed: $(date) =====" >> $LOG
echo "" >> $LOG
EOF
