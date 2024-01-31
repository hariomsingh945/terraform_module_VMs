output "rg_id" {
    value = [
      for id in azurerm_resource_group.example-rg: id.id
    ]
}