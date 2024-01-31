output "nsg_id" {
  value =[ 
    for nsg in azurerm_network_security_group.example_nsg: nsg.id
    ]
}