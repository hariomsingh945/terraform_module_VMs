data "azurerm_subnet" "example_subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "vnet_01"
  resource_group_name  = "rg_group1"
}

output "bastionsubnet_id" {
  value = data.azurerm_subnet.example_subnet.id
}

data "azurerm_public_ip" "example" {
  name                = "publicip01"
  resource_group_name = data.azurerm_subnet.example_subnet.resource_group_name
}

output "domain_name_label" {
  value = data.azurerm_public_ip.example.domain_name_label
}

output "public_ip_address" {
  value = data.azurerm_public_ip.example.ip_address
}