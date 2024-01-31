terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "storage-eastus-RG"
    storage_account_name = "storageeastusstc"
    container_name       = "storage-content"
    key                  = "comm-terraform.tfstate"
  }
}