
resource "azurerm_resource_group" "example-rg" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tag
}