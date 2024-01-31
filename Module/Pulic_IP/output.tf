output "ip_id" {
  value = [
    for ip in azurerm_public_ip.example_ip : ip.id
  ]
}