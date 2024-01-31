output "subnet_id" {
  value = [
    for subnet in azurerm_subnet.example_subnet : subnet.id
  ]
}