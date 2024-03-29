data "azurerm_subnet" "example_subnet" {
  for_each             = var.networkcard
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}
