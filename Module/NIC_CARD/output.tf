output "nic_id" {
  value = [
    for nic in azurerm_network_interface.example_nic : nic.id
  ]
}