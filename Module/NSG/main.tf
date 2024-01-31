resource "azurerm_network_security_group" "example_nsg" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "security_rule" {
    for_each = var.security
    content {
      name                       = security_rule.value.srule
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = security_rule.value.port
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}