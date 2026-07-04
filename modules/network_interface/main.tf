resource "azurerm_network_interface" "nic_block_01" {
  for_each = var.network_interfaces

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.public_ip_id
  }
  
  tags = var.common_tags
}