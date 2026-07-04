output "bastion_hosts" {
  description = "Details of created Bastion Hosts"
  value = {
    for k, bastion in azurerm_bastion_host.bastion_block_01 : k => {
      id       = bastion.id
      name     = bastion.name
      location = bastion.location
    }
  }
}