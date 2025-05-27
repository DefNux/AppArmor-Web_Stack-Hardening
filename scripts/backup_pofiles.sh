#!/bin/bash

#file: scripts/backups_profiles.sh

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/apparmor_profiles_backup_$TIMESTAMP.tar.gz"

#create backup directory if it doesn't exist

mkdir -p "$BACKUP_DIR"

#Archive and compress the profile
tar -cvf "$BACKUP_FILE" /etc/apparmor.d/

echo "[DONE] AppArmor profiles backed up to: $BACKUP_FILE "
