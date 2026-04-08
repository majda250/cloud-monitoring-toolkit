# Cloud Monitoring Toolkit

**Cloud Monitoring Toolkit** is a modular suite of monitoring scripts for cloud servers (AWS, Azure, GCP) or local machines.  
It provides comprehensive monitoring of system performance, security, resources, alerts, and generates detailed reports.

---

## 📦 Features

- **System Monitoring** : CPU, RAM, swap, uptime, load average, OS version, kernel
- **Storage Monitoring** : disk space, inodes, I/O, mount points, SMART health
- **Network Monitoring** : connectivity, DNS, HTTP/HTTPS, latency, traceroute, interfaces
- **Process Monitoring** : top CPU/memory processes, zombie processes, critical services
- **Security Monitoring** : failed SSH attempts, logged-in users, recent sudo, open ports, firewall status
- **Performance Testing** : CPU benchmark, memory speed, disk I/O, network speed, API response time
- **Alert System** : customizable thresholds (CPU, RAM, disk, latency) + webhooks (Slack, Discord, Teams)
- **Structured Logging** : log rotation, log levels (INFO/WARN/ERROR/DEBUG), JSON format
- **Reports** : timestamped HTML/JSON/PDF reports
- **Validation & Colors** : command existence checks, ANSI colored output

---

## 📁 Project Structure

cloud-monitoring-toolkit/
├── README.md
├── config.conf
├── install_deps.sh
├── monitor.sh
├── modules/
│ ├── network.sh
│ ├── system.sh
│ ├── storage.sh
│ ├── processes.sh
│ ├── security.sh
│ └── performance.sh
├── alerts/
│ ├── alert.sh
│ └── webhook.sh
├── utils/
│ ├── colors.sh
│ ├── logging.sh
│ └── validation.sh
├── docs/
│ ├── installation.md
│ ├── usage.md
│ └── api.md
├── reports/
└── logs/
text

---

## ⚙️ Prerequisites

- Linux (Ubuntu/Debian/CentOS/RHEL)
- Bash 4+
- Recommended tools: `sysbench`, `iostat`, `curl`, `traceroute`, `net-tools`, `bc`, `speedtest-cli`, `smartmontools`

---

## 🚀 Quick Installation

```bash
git clone git@github.com:majda250/cloud-monitoring-toolkit.git
cd cloud-monitoring-toolkit
chmod +x install_deps.sh monitor.sh
sudo ./install_deps.sh

    The installation script automatically checks for and installs missing dependencies.

⚙️ Configuration

Edit the config.conf file to set:

    Alert thresholds (CPU, memory, disk, latency)

    Webhooks (Slack, Discord, Teams)

    Monitoring interval

    Cloud provider (AWS/Azure/GCP/none)

    Log level and rotation settings

▶️ Usage
Manual monitoring
bash

./monitor.sh

Automated monitoring (crontab)

Example: run every 5 minutes
bash

*/5 * * * * /path/to/cloud-monitoring-toolkit/monitor.sh

Generate report only

Reports are automatically created in reports/ after each execution.
📊 Sample Output

    Logs: logs/monitor.log, logs/error.log, logs/alerts.log

    Reports: reports/report_YYYY-MM-DD_HHhMM.html

    Webhook alerts: JSON payload sent to configured endpoints

📚 Full Documentation

    Detailed Installation Guide

    Usage Guide

    API & Integration

🤝 Contributing

Contributions are welcome (new scripts, modules, documentation).
Please follow the existing format and add tests when possible.
