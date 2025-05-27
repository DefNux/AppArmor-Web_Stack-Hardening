#!/bin/bash

#FILE: scripts/enforce_profiles.sh

PROFILE_DIR="./profiles"
ENFORCED=0

echo "[INFO] Enforcing AppArmor profiles from $PROFILE_DIR..."

for profile in "$PROFILE_DIR"/*.apparmor; do
	PROFILE_NAME=$(basename "$profile")
	echo "→ Loading: $PROFILE_NAME"
	sudo cp "$profile" /etc/apparmor.d/
	sudo apparmor_parser -r "/etc/apparmor.d/$PROFILE_NAME"
	sudo aa-enforce "/etc/apparmor.d/$PROFILE_NAME"
	((ENFORCED++))
done

echo "[DONE] $ENFORCED profiles loaded and enforced."
