#####################################################
# Resource Groups
#####################################################

output "resource_groups" {
  description = "Created Resource Groups"
  value       = module.resource_group.resource_groups
}

#####################################################
# Virtual Networks
#####################################################

output "virtual_networks" {
  description = "Created Virtual Networks"
  value       = module.virtual_network.virtual_networks
}

#####################################################
# Subnets
#####################################################

output "subnets" {
  description = "Created Subnets"
  value       = module.subnet.subnets
}

#####################################################
# Public IPs
#####################################################

output "public_ips" {
  description = "Created Public IPs"
  value       = module.public_ip.public_ips
}

#####################################################
# Network Interfaces
#####################################################

output "network_interfaces" {
  description = "Created Network Interfaces"
  value       = module.network_interface.network_interfaces
}

#####################################################
# Virtual Machines
#####################################################

output "virtual_machines" {
  description = "Created Virtual Machines"
  value       = module.virtual_machine.virtual_machines
}

#####################################################
# Load Balancers
#####################################################

output "load_balancers" {
  description = "Created Load Balancers"
  value       = module.load_balancer.load_balancers
}

#####################################################
# Bastion Hosts
#####################################################

output "bastion_hosts" {
  description = "Created Bastion Hosts"
  value       = module.bastion.bastion_hosts
}

#####################################################
# Storage Accounts
#####################################################

output "storage_accounts" {
  description = "Created Storage Accounts"
  value       = module.storage_account.storage_accounts
}
