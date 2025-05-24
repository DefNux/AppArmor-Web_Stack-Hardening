# AppArmor Hardening for Web Stack

## 🛡 Overview
This project aims to secure a basic web application stack (Nginx, MySQL, and PHP-FPM) using AppArmor. It demonstrates how to create, enforce, and audit AppArmor profiles in an Ubuntu environment. Scripts are provided for policy enforcement, backup, and log parsing.

## 🧱 Stack Components
- **Web Server**: Nginx
- **Database**: MySQL/MariaDB
- **App Layer**: PHP-FPM or Flask (optional)
- **OS**: Ubuntu 22.04+

## 📂 Directory Structure
```
project_root/
├── profiles/                  # AppArmor profiles
│   ├── nginx.apparmor
│   ├── mysqld.apparmor
│   └── php-fpm.apparmor
├── scripts/                   # Shell scripts
│   ├── parse_apparmor_logs.sh
│   ├── enforce_profiles.sh
│   └── backup_profiles.sh
├── logs/                      # Sample logs
│   └── sample_apparmor_violations.log
├── README.md                  # Project instructions
└── LICENSE
```

## ⚙️ Setup Instructions
1. Install AppArmor and required services:
   ```bash
   sudo apt update && sudo apt install apparmor apparmor-utils nginx php-fpm mysql-server auditd logrotate -y
   ```
2. Copy AppArmor profiles to `/etc/apparmor.d/`:
   ```bash
   sudo cp profiles/*.apparmor /etc/apparmor.d/
   ```
3. Load and enforce each profile:
   ```bash
   sudo apparmor_parser -r /etc/apparmor.d/nginx.apparmor
   sudo aa-enforce /etc/apparmor.d/nginx.apparmor
   ```
4. Repeat for `mysqld` and `php-fpm`.

## 📊 Usage
### Log Parser:
Run the log parsing script to extract AppArmor denial messages:
```bash
./scripts/parse_apparmor_logs.sh
```

### Enforce Profiles:
```bash
./scripts/enforce_profiles.sh
```

### Backup All Profiles:
```bash
./scripts/backup_profiles.sh
```

## 🧠 Learn More
This project helps understand Linux MAC enforcement using AppArmor and provides hands-on experience with profile creation, security policy enforcement, and monitoring.
