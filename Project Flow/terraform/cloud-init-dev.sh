#!/bin/bash
# Cloud-init script for Development VM
# Installs development tools and Docker

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
    tree

# Install Java 11
apt-get install -y openjdk-11-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> /home/azureuser/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /home/azureuser/.bashrc

# Install Maven
wget https://downloads.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar -xzf apache-maven-3.8.6-bin.tar.gz -C /opt
echo 'export MAVEN_HOME=/opt/apache-maven-3.8.6' >> /home/azureuser/.bashrc
echo 'export PATH=$PATH:$MAVEN_HOME/bin' >> /home/azureuser/.bashrc

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

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Create development directories
mkdir -p /home/azureuser/dev/{complaint-tracking,healthcare-system,infrastructure}
chown -R azureuser:azureuser /home/azureuser/dev

# Install Jenkins (optional for local builds)
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install -y jenkins

# Start and enable Jenkins
systemctl start jenkins
systemctl enable jenkins

# Get Jenkins initial admin password
echo "Jenkins initial admin password:" > /home/azureuser/jenkins-password.txt
cat /var/lib/jenkins/secrets/initialAdminPassword >> /home/azureuser/jenkins-password.txt
chown azureuser:azureuser /home/azureuser/jenkins-password.txt

# Install monitoring tools
apt-get install -y prometheus-node-exporter
systemctl start prometheus-node-exporter
systemctl enable prometheus-node-exporter

# Create log directory
mkdir -p /var/log/deployment
chown azureuser:azureuser /var/log/deployment

# Set hostname
hostnamectl set-hostname ${hostname}

# Reboot to ensure all changes take effect
reboot
