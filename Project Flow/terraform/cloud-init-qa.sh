#!/bin/bash
# Cloud-init script for QA VM
# Installs testing tools and Docker

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
    python3-pip

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

# Install testing tools
pip3 install pytest requests selenium beautifulsoup4

# Install JMeter for load testing
wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-5.4.3.tgz
tar -xzf apache-jmeter-5.4.3.tgz -C /opt
echo 'export JMETER_HOME=/opt/apache-jmeter-5.4.3' >> /home/azureuser/.bashrc
echo 'export PATH=$PATH:$JMETER_HOME/bin' >> /home/azureuser/.bashrc

# Install Postman CLI (Newman)
npm install -g newman

# Install monitoring tools
apt-get install -y prometheus-node-exporter
systemctl start prometheus-node-exporter
systemctl enable prometheus-node-exporter

# Create QA testing directories
mkdir -p /home/azureuser/qa/{test-results,test-scripts,performance-tests}
chown -R azureuser:azureuser /home/azureuser/qa

# Create log directory
mkdir -p /var/log/deployment
chown azureuser:azureuser /var/log/deployment

# Set hostname
hostnamectl set-hostname ${hostname}

# Reboot to ensure all changes take effect
reboot
