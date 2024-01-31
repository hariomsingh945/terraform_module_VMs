resource "azurerm_subnet" "example_subnet" {
  for_each             = var.subnets
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.network_name
  address_prefixes     = each.value.address_prefixes1
}