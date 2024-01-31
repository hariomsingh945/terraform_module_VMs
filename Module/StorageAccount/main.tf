
locals {
  rg_name  = "${var.prefix}-${var.location}-RG"
  st_name  = "${var.prefix}${var.location}stc"
  location = var.location
  container_name = "${var.prefix}-content"
}




resource "azurerm_resource_group" "example-rg" {
  name     = local.rg_name
  location = local.location
}

resource "azurerm_storage_account" "example-stc" {
  name                     = local.st_name
  resource_group_name      = azurerm_resource_group.example-rg.name
  location                 = azurerm_resource_group.example-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "backendfile"
  }
}

resource "azurerm_storage_container" "example-container" {
  name                  = local.container_name
  storage_account_name  = azurerm_storage_account.example-stc.name
  container_access_type = "private"
}