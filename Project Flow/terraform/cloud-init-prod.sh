#!/bin/bash
# Cloud-init script for Production VM
# Installs production tools and Docker

# Update system
apt-get update
apt-get upgrade -y

# Install essential packages
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    unzip \
    git \
    wget \
    vim \
    htop \
    tree \
    python3 \
    python3-pip \
    nginx \
    fail2ban \
    ufw

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Add user to docker group
usermod -aG docker azureuser

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Install monitoring tools
apt-get install -y prometheus-node-exporter
systemctl start prometheus-node-exporter
systemctl enable prometheus-node-exporter

# Install Grafana
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list
apt-get update
apt-get install -y grafana
systemctl start grafana-server
systemctl enable grafana-server

# Install ELK Stack (Elasticsearch, Logstash, Kibana)
# Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
apt-get update
apt-get install -y elasticsearch
systemctl start elasticsearch
systemctl enable elasticsearch

# Logstash
apt-get install -y logstash
systemctl start logstash
systemctl enable logstash

# Kibana
apt-get install -y kibana
systemctl start kibana
systemctl enable kibana

# Configure firewall
ufw --force enable
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8080/tcp
ufw allow 3000/tcp  # Grafana
ufw allow 9200/tcp  # Elasticsearch
ufw allow 5601/tcp  # Kibana

# Configure fail2ban
systemctl start fail2ban
systemctl enable fail2ban

# Create production directories
mkdir -p /home/azureuser/prod/{applications,logs,backups,monitoring}
chown -R azureuser:azureuser /home/azureuser/prod

# Create log directory
mkdir -p /var/log/deployment
chown azureuser:azureuser /var/log/deployment

# Setup log rotation
cat > /etc/logrotate.d/deployment << EOF
/var/log/deployment/*.log {
    daily
    missingok
    rotate 30
    compress
    delaycompress
    notifempty
    create 644 azureuser azureuser
}
EOF

# Setup backup script
cat > /home/azureuser/backup-script.sh << 'EOF'
#!/bin/bash
# Production backup script
BACKUP_DIR="/home/azureuser/prod/backups"
DATE=$(date +%Y%m%d_%H%M%S)

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup application data
docker ps --format "{{.Names}}" | while read container; do
    echo "Backing up container: $container"
    docker commit $container backup_${container}_${DATE}
    docker save backup_${container}_${DATE} > $BACKUP_DIR/backup_${container}_${DATE}.tar
done

# Backup logs
tar -czf $BACKUP_DIR/logs_${DATE}.tar.gz /var/log/deployment /home/azureuser/prod/logs

# Cleanup old backups (keep last 7 days)
find $BACKUP_DIR -name "*.tar" -mtime +7 -delete
find $BACKUP_DIR -name "*.tar.gz" -mtime +7 -delete

echo "Backup completed at $DATE" >> /var/log/deployment/backup.log
EOF

chmod +x /home/azureuser/backup-script.sh
chown azureuser:azureuser /home/azureuser/backup-script.sh

# Setup cron job for automated backups
echo "0 2 * * * /home/azureuser/backup-script.sh" | crontab -u azureuser -

# Set hostname
hostnamectl set-hostname ${hostname}

# Reboot to ensure all changes take effect
reboot
