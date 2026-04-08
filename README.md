# ☁️ Cloud Monitoring Toolkit

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Linux](https://img.shields.io/badge/Linux-supported-success.svg)](https://www.linux.org/)

**Cloud Monitoring Toolkit** is a modular suite of monitoring scripts for cloud servers (AWS, Azure, GCP) and local machines. Monitor system performance, security, resources, receive alerts, and generate beautiful reports.

---

## ✨ Features

| Category | Description |
|----------|-------------|
| 🖥️ **System** | CPU, RAM, swap, uptime, load average, OS, kernel |
| 💾 **Storage** | Disk space, inodes, I/O, mount points, SMART health |
| 🌐 **Network** | Connectivity, DNS, HTTP/HTTPS, latency, traceroute, interfaces |
| ⚙️ **Processes** | Top CPU/memory processes, zombies, critical services |
| 🔒 **Security** | Failed SSH attempts, logged users, sudo, open ports, firewall |
| 🚀 **Performance** | CPU benchmark, memory speed, disk I/O, network speed, API response |
| 🔔 **Alerts** | Custom thresholds + Webhooks (Slack, Discord, Teams) |
| 📝 **Logging** | Log rotation, levels (INFO/WARN/ERROR/DEBUG), JSON format |
| 📊 **Reports** | Timestamped HTML/JSON/PDF reports |
| 🎨 **Colors** | ANSI colored output for better readability |

---

## 📁 Project Structure
cloud-monitoring-toolkit/
├── 📘 README.md
├── ⚙️ config.conf
├── 🔧 install_deps.sh
├── 🚀 monitor.sh
├── 📂 modules/
│ ├── 🌐 network.sh
│ ├── 🖥️ system.sh
│ ├── 💾 storage.sh
│ ├── ⚙️ processes.sh
│ ├── 🔒 security.sh
│ └── 🚀 performance.sh
├── 🔔 alerts/
│ ├── alert.sh
│ └── webhook.sh
├── 🛠️ utils/
│ ├── colors.sh
│ ├── logging.sh
│ └── validation.sh
├── 📚 docs/
│ ├── installation.md
│ ├── usage.md
│ └── api.md
├── 📁 reports/
└── 📁 logs/

text

---

## 📋 Prerequisites

- 🐧 Linux (Ubuntu/Debian/CentOS/RHEL)
- 📦 Bash 4+
- 🔧 Recommended tools: `sysbench`, `iostat`, `curl`, `traceroute`, `net-tools`, `bc`, `speedtest-cli`, `smartmontools`

---

## ⚡ Quick Installation

```bash
git clone https://github.com/your-username/cloud-monitoring-toolkit.git
cd cloud-monitoring-toolkit
chmod +x install_deps.sh monitor.sh
sudo ./install_deps.sh
💡 Tip: The installation script automatically checks and installs missing dependencies.

⚙️ Configuration
Edit config.conf to set:

ini
# Alert thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=90
DISK_THRESHOLD=85
LATENCY_THRESHOLD=100

# Webhooks
SLACK_WEBHOOK="https://hooks.slack.com/services/xxx"
DISCORD_WEBHOOK="https://discord.com/api/webhooks/xxx"

# Monitoring interval (seconds)
INTERVAL=300

# Cloud provider: aws, azure, gcp, none
CLOUD_PROVIDER="none"

# Log level: INFO, WARN, ERROR, DEBUG
LOG_LEVEL="INFO"
🚀 Usage
Manual run
bash
./monitor.sh
Automated monitoring (crontab)
Run every 5 minutes:

bash
*/5 * * * * /home/user/cloud-monitoring-toolkit/monitor.sh
One-liner with custom config
bash
CONFIG_FILE=/path/to/custom.conf ./monitor.sh
📊 Sample Output
bash
$ ./monitor.sh

[INFO] 2025-01-15 10:30:00 - Starting Cloud Monitoring Toolkit
[INFO] 2025-01-15 10:30:01 - Loading configuration...
[SUCCESS] 2025-01-15 10:30:01 - Config loaded successfully

[INFO] 2025-01-15 10:30:02 - Running system module...
✅ CPU: 23% | RAM: 45% | Uptime: 3d 2h

[INFO] 2025-01-15 10:30:03 - Running network module...
✅ Connectivity: OK | DNS: OK | Latency: 12ms

[WARN] 2025-01-15 10:30:05 - Disk usage above threshold (88% > 85%)

[SUCCESS] 2025-01-15 10:30:10 - Report generated: reports/report_20250115_103010.html

[INFO] 2025-01-15 10:30:10 - Monitoring completed successfully
📁 Generated Files
Path	Description
logs/monitor.log	All execution logs
logs/error.log	Error messages only
logs/alerts.log	Alert history
reports/*.html	HTML reports
reports/*.json	JSON reports
reports/*.pdf	PDF reports (if configured)
📚 Documentation
Document	Description
installation.md	Detailed installation guide
usage.md	Usage examples and tips
api.md	API for advanced integration
🤝 Contributing
Contributions are welcome!

🍴 Fork the project

🌿 Create your branch (git checkout -b feature/amazing)

💾 Commit your changes (git commit -m 'feat: add amazing feature')

📤 Push to the branch (git push origin feature/amazing)

🎉 Open a Pull Request

📄 License
Distributed under the MIT License. See LICENSE file for more information.

🙏 Acknowledgments
sysbench - CPU & memory benchmarking

speedtest-cli - Network speed testing

smartmontools - Disk health monitoring

⭐ Star this repository if you find it useful!
