resource "azurerm_lb" "lb_block_01" {
  for_each = var.load_balancers

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  tags = var.common_tags

  frontend_ip_configuration {
    name                 = each.value.frontend_name
    public_ip_address_id = each.value.public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_bap_01" {
  for_each = var.load_balancers

  name            = each.value.backend_pool_name
  loadbalancer_id = azurerm_lb.lb_block_01[each.key].id
}

resource "azurerm_lb_probe" "lb_probe_01" {
  for_each = var.load_balancers

  name            = each.value.probe_name
  loadbalancer_id = azurerm_lb.lb_block_01[each.key].id
  protocol        = "Tcp"
  port            = each.value.probe_port
}

resource "azurerm_lb_rule" "lb_rule_01" {
  for_each = var.load_balancers

  name            = each.value.rule_name
  loadbalancer_id = azurerm_lb.lb_block_01[each.key].id
  protocol        = each.value.protocol

  frontend_port = each.value.frontend_port
  backend_port  = each.value.backend_port

  frontend_ip_configuration_name = each.value.frontend_name

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.lb_bap_01[each.key].id
  ]

  probe_id = azurerm_lb_probe.lb_probe_01[each.key].id
}