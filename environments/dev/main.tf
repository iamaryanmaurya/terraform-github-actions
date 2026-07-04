#########################################################
# Resource Group
#########################################################

module "resource_group" {
  source = "../../modules/resource_group"

  resource_groups = var.resource_groups
  common_tags     = var.common_tags
}

#########################################################
# Virtual Network
#########################################################

module "virtual_network" {
  source = "../../modules/virtual_network"

  virtual_networks = var.virtual_networks
  common_tags      = var.common_tags

  depends_on = [
    module.resource_group
  ]
}

#########################################################
# Subnet
#########################################################

module "subnet" {
  source = "../../modules/subnet"

  subnets = var.subnets

  depends_on = [
    module.virtual_network
  ]
}

#########################################################
# Public IP
#########################################################

module "public_ip" {
  source = "../../modules/public_ip"

  public_ips  = var.public_ips
  common_tags = var.common_tags

  depends_on = [
    module.resource_group
  ]
}

#########################################################
# Storage Account
#########################################################

module "storage_account" {
  source = "../../modules/storage_account"

  storage_accounts = var.storage_accounts
  common_tags      = var.common_tags

  depends_on = [
    module.resource_group
  ]
}

#########################################################
# Network Interface
#########################################################

module "network_interface" {
  source = "../../modules/network_interface"

  network_interfaces = var.network_interfaces
  common_tags        = var.common_tags

  depends_on = [
    module.subnet,
    module.public_ip
  ]
}

#########################################################
# Virtual Machine
#########################################################

module "virtual_machine" {
  source = "../../modules/virtual_machine"

  virtual_machines = var.virtual_machines
  common_tags      = var.common_tags

  depends_on = [
    module.network_interface,
    module.storage_account
  ]
}

#########################################################
# Load Balancer
#########################################################

module "load_balancer" {
  source = "../../modules/load_balancer"

  load_balancers = var.load_balancers
  common_tags    = var.common_tags

  depends_on = [
    module.public_ip,
    module.network_interface
  ]
}

#########################################################
# Bastion
#########################################################

module "bastion" {
  source = "../../modules/bastion"

  bastion_hosts = var.bastion_hosts
  common_tags   = var.common_tags

  depends_on = [
    module.subnet,
    module.public_ip
  ]
}
