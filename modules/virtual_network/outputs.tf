output "virtual_networks" {
    description = "Virtual Network details."
  value = {
    for k, vnet in azurerm_virtual_network.vnet_block_01 : k => {
      id   = vnet.id
      name = vnet.name
    }
  }
}