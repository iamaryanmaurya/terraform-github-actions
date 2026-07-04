output "public_ips" {
    description = "Public IP address details."
  value = {
    for k, pip in azurerm_public_ip.public_ip_block_01 : k => {
      id   = pip.id
      name = pip.name
      ip   = pip.ip_address
    }
  }
}