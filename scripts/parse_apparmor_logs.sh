#!/bin/sh

#FILE: scripts/parse_apparmor_logs.sh

LOG_OUTPUT="/home/app/apparmor-web-hardening/logs/sample_apparmor_violations.logs"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "==== AppArmor Denied Logs: $DATE ====" > "$LOG_OUTPUT"

#search system logs for apparmor denied entries
grep -i "apparmor=\"DENIED\"" /var/log/syslog | tee -a "$LOG_OUTPUT"

echo -e "\n[INFO] Parsed logs saved to $LOG_OUTPUT"


