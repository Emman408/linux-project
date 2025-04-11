#!/usr/bin/env bash

OUT=/var/log/critical_events
mkdir -p "$OUT"

# Failed SSH logins
grep "Failed password" /var/log/remote/student.log > "$OUT/failed_ssh.log"

# Service failures (using journalctl)
journalctl -p err -b > "$OUT/service_failures.log"

# System reboots
last reboot | head -n 10 > "$OUT/reboots.log"
