output "subnets" {
  description = "Subnet details."

  value = {
    for key, subnet in azurerm_subnet.subnet_block_01 : key => {
      id   = subnet.id
      name = subnet.name
    }
  }
}