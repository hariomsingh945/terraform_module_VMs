resource "azurerm_public_ip" "example_ip" {
  for_each            = var.ipaddress
  name                = each.value.pubipname
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku1
}