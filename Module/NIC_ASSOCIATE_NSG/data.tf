data "azurerm_network_security_group" "example_nsg" {
  for_each            = var.nicnsgmap
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "example_nic" {
  for_each            = var.nicnsgmap
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}