output "network_interfaces" {
  description = "Network Interface details."

  value = {
    for key, nic in azurerm_network_interface.nic_block_01 : key => {
      id   = nic.id
      name = nic.name
    }
  }
}