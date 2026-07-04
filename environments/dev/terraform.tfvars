##########################################
# Common Tags
##########################################

common_tags = {
  Environment = "Development"
  Project     = "Azure Terraform Infrastructure"
  Owner       = "Aryan Maurya"
  ManagedBy   = "Terraform"
}

##########################################
# Resource Group
##########################################

resource_groups = {
  rg01 = {
    name     = "rg-dev-001"
    location = "Central India"
  }
}

##########################################
# Virtual Network
##########################################

virtual_networks = {
  vnet01 = {
    name                = "vnet-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"

    address_space = [
      "10.0.0.0/16"
    ]
  }
}

##########################################
# Subnet
##########################################

subnets = {

  subnet01 = {
    name                 = "subnet-dev-001"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }

  AzureBastionSubnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"

    address_prefixes = [
      "10.0.2.0/26"
    ]
  }
}

##########################################
# Public IP
##########################################

public_ips = {

  pip_vm = {
    name                = "pip-vm-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip_lb = {
    name                = "pip-lb-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip_bastion = {
    name                = "pip-bastion-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

##########################################
# Network Interface
##########################################

network_interfaces = {

  nic01 = {

    name                = "nic-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"

    subnet_id = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/rg-dev-001/providers/Microsoft.Network/virtualNetworks/vnet-dev-001/subnets/subnet-dev-001"

    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"

    public_ip_id = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/rg-dev-001/providers/Microsoft.Network/publicIPAddresses/pip-vm-dev-001"
  }
}

##########################################
# Virtual Machine
##########################################

virtual_machines = {

  vm01 = {

    name                = "vm-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"
    size                = "Standard_B2s"
    admin_username      = "azureuser"
    admin_password      = "Password@123"

    network_interface_ids = [
      "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/rg-dev-001/providers/Microsoft.Network/networkInterfaces/nic-dev-001"
    ]
  }
}

##########################################
# Storage Account
##########################################

storage_accounts = {

  stg01 = {

    name                     = "stgdev001xyz123"
    location                 = "Central India"
    resource_group_name      = "rg-dev-001"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

##########################################
# Load Balancer
##########################################

load_balancers = {

  lb01 = {

    name                = "lb-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"

    sku = "Standard"

    frontend_name = "frontend-ip"
    public_ip_id  = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/rg-dev-001/providers/Microsoft.Network/publicIPAddresses/pip-lb-dev-001"

    backend_pool_name = "backend-pool"
    probe_name        = "tcp-probe"
    probe_port        = 80
    probe_protocol    = "Tcp"
    rule_name         = "http-rule"
    protocol          = "Tcp"
    frontend_port     = 80
    backend_port      = 80
  }
}

##########################################
# Bastion
##########################################

bastion_hosts = {

  bastion01 = {

    name                = "bastion-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"

    sku = "Standard"

    subnet_id = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/rg-dev-001/providers/Microsoft.Network/virtualNetworks/vnet-dev-001/subnets/AzureBastionSubnet"

    public_ip_id = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/rg-dev-001/providers/Microsoft.Network/publicIPAddresses/pip-bastion-dev-001"
  }
}
