resource "azurerm_bastion_host" "example_bastion" {
  name                = "examplebastion"
  location            = "eastus"
  resource_group_name = "rg_group1"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.example_subnet.id
    public_ip_address_id = data.azurerm_public_ip.example.id
  }
}