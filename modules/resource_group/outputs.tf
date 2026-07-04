output "resource_groups" {
  value = {
    for key, rg in azurerm_resource_group.rg_block_01 : key => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}
