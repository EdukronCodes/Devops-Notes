# Terraform configuration for Azure DevOps CI/CD Infrastructure
# Covers: VMs, AKS clusters, storage accounts, and networking

terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatedevops"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-devops-automation"
  location = "East US"
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
    Owner       = "DevOps Team"
  }
}

# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "vnet-devops"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Subnets
resource "azurerm_subnet" "dev" {
  name                 = "subnet-dev"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "qa" {
  name                 = "subnet-qa"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "prod" {
  name                 = "subnet-prod"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.3.0/24"]
}

# Network Security Groups
resource "azurerm_network_security_group" "dev" {
  name                = "nsg-dev"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "HTTPS"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
  
  tags = {
    Environment = "Development"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_network_security_group" "qa" {
  name                = "nsg-qa"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
  
  tags = {
    Environment = "QA"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_network_security_group" "prod" {
  name                = "nsg-prod"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Public IPs
resource "azurerm_public_ip" "dev" {
  name                = "pip-dev"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  
  tags = {
    Environment = "Development"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_public_ip" "qa" {
  name                = "pip-qa"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  
  tags = {
    Environment = "QA"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_public_ip" "prod" {
  name                = "pip-prod"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Network Interfaces
resource "azurerm_network_interface" "dev" {
  name                = "nic-dev"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.dev.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.dev.id
  }
  
  tags = {
    Environment = "Development"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_network_interface" "qa" {
  name                = "nic-qa"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.qa.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.qa.id
  }
  
  tags = {
    Environment = "QA"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_network_interface" "prod" {
  name                = "nic-prod"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.prod.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.prod.id
  }
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "dev" {
  name                = "vm-dev"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"
  
  network_interface_ids = [
    azurerm_network_interface.dev.id,
  ]
  
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  
  custom_data = base64encode(templatefile("${path.module}/cloud-init-dev.sh", {
    hostname = "vm-dev"
  }))
  
  tags = {
    Environment = "Development"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_linux_virtual_machine" "qa" {
  name                = "vm-qa"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"
  
  network_interface_ids = [
    azurerm_network_interface.qa.id,
  ]
  
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  
  custom_data = base64encode(templatefile("${path.module}/cloud-init-qa.sh", {
    hostname = "vm-qa"
  }))
  
  tags = {
    Environment = "QA"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_linux_virtual_machine" "prod" {
  name                = "vm-prod"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_D2s_v3"
  admin_username      = "azureuser"
  
  network_interface_ids = [
    azurerm_network_interface.prod.id,
  ]
  
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  
  custom_data = base64encode(templatefile("${path.module}/cloud-init-prod.sh", {
    hostname = "vm-prod"
  }))
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# AKS Clusters
resource "azurerm_kubernetes_cluster" "dev" {
  name                = "aks-dev"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-dev"
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }
  
  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    Environment = "Development"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_kubernetes_cluster" "qa" {
  name                = "aks-qa"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-qa"
  
  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }
  
  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    Environment = "QA"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_kubernetes_cluster" "prod" {
  name                = "aks-prod"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-prod"
  
  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2s_v3"
  }
  
  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Container Registry
resource "azurerm_container_registry" "main" {
  name                = "acrdevopsprod"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Standard"
  admin_enabled       = true
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Storage Account for Terraform State
resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstatedevops"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

# Backup Vault
resource "azurerm_recovery_services_vault" "main" {
  name                = "backup-vault-prod"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
  
  tags = {
    Environment = "Production"
    Project     = "DevOps Automation"
  }
}

# Outputs
output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "aks_dev_name" {
  value = azurerm_kubernetes_cluster.dev.name
}

output "aks_qa_name" {
  value = azurerm_kubernetes_cluster.qa.name
}

output "aks_prod_name" {
  value = azurerm_kubernetes_cluster.prod.name
}

output "container_registry_name" {
  value = azurerm_container_registry.main.name
}

output "vm_dev_public_ip" {
  value = azurerm_public_ip.dev.ip_address
}

output "vm_qa_public_ip" {
  value = azurerm_public_ip.qa.ip_address
}

output "vm_prod_public_ip" {
  value = azurerm_public_ip.prod.ip_address
}
