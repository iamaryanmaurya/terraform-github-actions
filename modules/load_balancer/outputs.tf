output "load_balancers" {
    description = "Load Balancer details."
  value = {
    for k, lb in azurerm_lb.lb_block_01 : k => {
      id   = lb.id
      name = lb.name
    }
  }
}