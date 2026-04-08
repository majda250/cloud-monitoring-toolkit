
🖥️ Cloud Monitoring Toolkit

Un toolkit de monitoring complet en Bash pour surveiller vos serveurs cloud (AWS, Azure, GCP) ou on-premise — réseau, système, stockage, processus, sécurité et performance.
📋 Table des matières

    Aperçu
    Prérequis
    Installation
    Configuration
    Utilisation
    Modules
    Alertes & Notifications
    Rapports & Logs
    Structure du projet
    Licence

Aperçu

cloud-monitoring-toolkit est un ensemble de scripts Bash modulaires permettant de surveiller en temps réel l'état d'un serveur ou d'une infrastructure cloud. Il couvre :

    ✅ Connectivité réseau et latence
    ✅ Usage CPU, RAM, swap et load average
    ✅ Espace disque, I/O et santé des partitions
    ✅ Processus actifs, zombies et services critiques
    ✅ Tentatives d'intrusion, ports ouverts et firewall
    ✅ Benchmarks de performance (CPU, disque, réseau)
    ✅ Alertes automatiques via Slack, Discord, Teams ou webhook personnalisé

Prérequis

    Bash 4.0+
    Linux (Ubuntu, Debian, CentOS, RHEL, ou compatible)
    Accès sudo pour certains modules (sécurité, SMART)
    Connexion Internet (pour les tests réseau et les webhooks)

Outils utilisés (installés automatiquement via install_deps.sh) :
Outil 	Usage
curl 	Tests HTTP/HTTPS, envoi webhooks
traceroute 	Diagnostic réseau
net-tools 	Interfaces réseau
sysbench 	Benchmark CPU et mémoire
iostat 	Monitoring I/O disque
bc 	Calculs arithmétiques dans les scripts
Installation
1. Cloner le dépôt

git clone https://github.com/votre-utilisateur/cloud-monitoring-toolkit.git
cd cloud-monitoring-toolkit

2. Installer les dépendances

chmod +x install_deps.sh
./install_deps.sh

3. Rendre les scripts exécutables

chmod +x monitor.sh
chmod +x modules/*.sh alerts/*.sh utils/*.sh

4. Configurer les seuils et alertes

Éditez le fichier config.conf selon votre environnement (voir section Configuration).
Configuration

Le fichier config.conf centralise tous les paramètres du toolkit :

# Seuils d'alerte
CPU_THRESHOLD=85          # % d'usage CPU avant alerte
MEM_THRESHOLD=90          # % d'usage RAM avant alerte
DISK_THRESHOLD=80         # % d'espace disque avant alerte
LATENCY_THRESHOLD=200     # ms de latence réseau avant alerte

# Fournisseur cloud
CLOUD_PROVIDER="AWS"      # AWS | Azure | GCP | none

# Notifications
WEBHOOK_URL="https://hooks.slack.com/services/XXX/YYY/ZZZ"
ALERT_EMAIL="admin@example.com"

# Intervalles
MONITOR_INTERVAL=60       # secondes entre chaque cycle
LOG_RETENTION_DAYS=30     # durée de conservation des logs

# Niveau de log
LOG_LEVEL="INFO"          # DEBUG | INFO | WARN | ERROR

Utilisation
Lancement manuel

./monitor.sh

Monitoring continu via crontab

# Toutes les 5 minutes
*/5 * * * * /chemin/vers/cloud-monitoring-toolkit/monitor.sh >> /var/log/cloud-monitor.log 2>&1

Exécuter un module seul

./modules/network.sh
./modules/system.sh
./modules/security.sh

Générer uniquement un rapport

./monitor.sh --report-only

Modules
Module 	Description
network.sh 	Connectivité Internet, DNS, HTTP/HTTPS, latence, traceroute, IP locale/publique
system.sh 	CPU, RAM, swap, uptime, load average (1/5/15 min), version OS et kernel
storage.sh 	Espace disque par partition, inodes, I/O, plus gros dossiers, santé SMART
processes.sh 	Top 5 processus CPU/RAM, zombies, nombre total, statut des services (SSH, Docker, Nginx, MySQL…)
security.sh 	Connexions SSH échouées, utilisateurs connectés, sudo récents, ports ouverts, firewall
performance.sh 	Benchmark CPU (sysbench), vitesse mémoire, I/O disque (dd), speedtest, latence API
Alertes & Notifications

Le système d'alertes compare les valeurs collectées aux seuils définis dans config.conf.
Niveaux d'alerte

    🟡 MINOR — Valeur proche du seuil (80–95 %)
    🔴 CRITICAL — Valeur dépassant le seuil (> 95 %)

Canaux supportés

    Slack — via Incoming Webhook
    Discord — via Webhook bot
    Microsoft Teams — via Connector
    Webhook personnalisé — payload JSON configurable

Le module webhook.sh gère les tentatives de retry automatique en cas d'échec d'envoi.
Rapports & Logs
Rapports (reports/)

Les rapports sont générés automatiquement à chaque cycle :

    Format : HTML, JSON ou PDF (configurable)
    Nommage : report_YYYY-MM-DD_HH-MM-SS.html
    Archivage automatique des rapports anciens

Logs (logs/)
Fichier 	Contenu
monitor.log 	Logs d'exécution généraux
error.log 	Erreurs et exceptions
alerts.log 	Historique de toutes les alertes déclenchées

La rotation automatique des logs est gérée par utils/logging.sh selon LOG_RETENTION_DAYS.
Structure du projet

cloud-monitoring-toolkit/
├── README.md
├── config.conf
├── install_deps.sh
├── monitor.sh
├── modules/
│   ├── network.sh
│   ├── system.sh
│   ├── storage.sh
│   ├── processes.sh
│   ├── security.sh
│   └── performance.sh
├── alerts/
│   ├── alert.sh
│   └── webhook.sh
├── utils/
│   ├── colors.sh
│   ├── logging.sh
│   └── validation.sh
├── reports/       # Rapports générés (auto)
├── logs/          # Fichiers de log (auto)
└── docs/
    ├── installation.md
    ├── usage.md
    └── api.md

Flux d'exécution

monitor.sh
  └── charge config.conf
  └── exécute modules/ (network → system → storage → processes → security → performance)
        └── chaque module utilise utils/ (colors, logging, validation)
        └── alert.sh vérifie les seuils après chaque module
              └── si alerte → webhook.sh envoie la notification
  └── génère le rapport dans reports/
  └── tout est loggé dans logs/

Documentation

La documentation complète est disponible dans le dossier docs/ :

    docs/installation.md — Guide d'installation détaillé et dépannage
    docs/usage.md — Exemples d'utilisation et intégration crontab
    docs/api.md — Fonctions exportables et intégration avancée

Licence

Ce projet est distribué sous licence MIT. Voir le fichier LICENSE pour plus de détails.

    Développé pour simplifier le monitoring d'infrastructures cloud et on-premise. Contributions bienvenues !
