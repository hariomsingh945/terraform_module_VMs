resource "azurerm_network_interface_security_group_association" "example" {
  for_each                  = var.nicnsgmap
  network_interface_id      = data.azurerm_network_interface.example_nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.example_nsg[each.key].id
}