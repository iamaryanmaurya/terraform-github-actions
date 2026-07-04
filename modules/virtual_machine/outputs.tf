output "virtual_machines" {
  description = "Virtual Machine details."

  value = {
    for key, vm in azurerm_linux_virtual_machine.vm_block_01 : key => {
      id   = vm.id
      name = vm.name
    }
  }
}