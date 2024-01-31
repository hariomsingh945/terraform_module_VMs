output "vm_id" {
    value = [
        for vm in azurerm_linux_virtual_machine.example_vms: vm.id
    ]
  
}