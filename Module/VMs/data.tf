data "azurerm_network_interface" "example_nic" {
  for_each            = var.vmlinux
  name                = each.value.network_interface_name
  resource_group_name = each.value.rg_name
}