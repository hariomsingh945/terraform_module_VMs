resource "azurerm_network_interface" "example_nic" {
  for_each            = var.networkcard
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ipconf_name
    subnet_id                     = data.azurerm_subnet.example_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}