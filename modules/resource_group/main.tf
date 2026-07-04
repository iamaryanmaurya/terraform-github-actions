resource "azurerm_resource_group" "rg_block_01" {
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location

  tags = var.common_tags
}