rgs = {
  "rg1" = {
    "name"     = "rg_group1"
    "location" = "eastus"
    "tag" = {
      environment = "dev"
    }
  }
  "rg2" = {
    "name"     = "rg_group2"
    "location" = "eastus"
  }
  "rg3" = {
    "name"     = "rg_group3"
    "location" = "eastus"
    "tag" = {
      environment = "prod"
    }
  }
  "rg4" = {
    "name"     = "rg_group4"
    "location" = "eastus"
  }
}

# The below code for Virtual Network

##Vnet first
vnets = {
  "vnet1" = {
    "name"          = "vnet_01"
    "location"      = "eastus"
    "rg_name"       = "rg_group1"
    "address_space" = ["10.1.0.0/16"]
  }

  #### 2nd Vnet

  "vnet2" = {
    "name"          = "vnet_02"
    "location"      = "eastus"
    "rg_name"       = "rg_group1"
    "address_space" = ["10.2.0.0/16"]
  }
  ## 3rd Vnet
  "vnet3" = {
    "name"          = "vnet_03"
    "location"      = "eastus"
    "rg_name"       = "rg_group1"
    "address_space" = ["10.3.0.0/16"]
  }
}

# The below code for subnet
subnets = {
  "subnet1" = {
    "subnet_name"       = "subnet01"
    "rg_name"           = "rg_group1"
    "network_name"      = "vnet_01"
    "address_prefixes1" = ["10.1.1.0/24"]
  }
  "subnet2" = {
    "subnet_name"       = "subnet02"
    "rg_name"           = "rg_group1"
    "network_name"      = "vnet_01"
    "address_prefixes1" = ["10.1.2.0/24"]
  }
  "subnet3" = {
    "subnet_name"       = "AzureBastionSubnet"
    "rg_name"           = "rg_group1"
    "network_name"      = "vnet_01"
    "address_prefixes1" = ["10.1.3.0/24"]
  }
    "subnet4" = {
    "subnet_name"       = "subnet01"
    "rg_name"           = "rg_group1"
    "network_name"      = "vnet_02"
    "address_prefixes1" = ["10.2.1.0/24"]
  }
}

#The below code for public ip
ipaddress = {
  "ip1" = {
    pubipname         = "publicip01"
    location          = "eastus"
    rg_name           = "rg_group1"
    allocation_method = "Static"
    sku1              = "Standard"
  }
}

#The NSG code
nsg = {
  nsg1 = {
    nsg_name = "nsg_dev"
    location = "eastus"
    rg_name  = "rg_group1"
  }
  # nsg2 = {
  #   nsg_name = "nsg_prod"
  #   location = "eastus"
  #   rg_name  = "rg_group1"
  # }
  # nsg3 = {
  #   nsg_name = "nsg_pord1"
  #   location = "eastus"
  #   rg_name  = "rg_group1"
  # }
}
security = {
  sg1 = {
    srule    = "test1234"
    priority = 101
    port     = 80
  }
  sg2 = {
    srule    = "test123"
    priority = 100
    port     = 22
  }
}
#THE NIC Card
networkcard = {
  "nic1" = {
    "nic_name"                      = "nic01"
    "location"                      = "eastus"
    "rg_name"                       = "rg_group1"
    "ipconf_name"                   = "internal"
    "private_ip_address_allocation" = "Dynamic"
    "subnet_name"                   = "subnet01"
    "vnet_name"                     = "vnet_01"
  }
   "nic2" = {
    "nic_name"                      = "nic02"
    "location"                      = "eastus"
    "rg_name"                       = "rg_group1"
    "ipconf_name"                   = "internal"
    "private_ip_address_allocation" = "Dynamic"
    "subnet_name"                   = "subnet01"
    "vnet_name"                     = "vnet_01"
  }
  "nic3" = {
    "nic_name"                      = "nic03"
    "location"                      = "eastus"
    "rg_name"                       = "rg_group1"
    "ipconf_name"                   = "internal"
    "private_ip_address_allocation" = "Dynamic"
    "subnet_name"                   = "subnet01"
    "vnet_name"                     = "vnet_02"
  }
}

##THE NIC Card associate with NSG
nicnsgmap = {
  "map1" = {
    nsg_name = "nsg_dev"
    nic_name = "nic01"
    rg_name  = "rg_group1"
  }
  "map2" = {
    nsg_name = "nsg_dev"
    nic_name = "nic02"
    rg_name  = "rg_group1"
  }
    "map3" = {
    nsg_name = "nsg_dev"
    nic_name = "nic03"
    rg_name  = "rg_group1"
  }
}

###Azurebastion no tfvars

##VMS

vmlinux = {
  vm1 = {
    "vm_name"                         = "vm01"
    "rg_name"                         = "rg_group1"
    "location"                        = "eastus"
    "size"                            = "Standard_F2"
    "admin_username"                  = "azureadmin"
    "passw"                           = "redhat@1234"
    "network_interface_name"          = "nic01"
    "disable_password_authentication" = "false"
    publisher                         = "Canonical"
    offer                             = "0001-com-ubuntu-server-jammy"
    sku                               = "22_04-lts"
    version                           = "latest"
  }
  vm2 = {
    "vm_name"                         = "vm02"
    "rg_name"                         = "rg_group1"
    "location"                        = "eastus"
    "size"                            = "Standard_F2"
    "admin_username"                  = "azureadmin"
    "passw"                           = "redhat@1234"
    "network_interface_name"          = "nic02"
    "disable_password_authentication" = "false"
    publisher                         = "Canonical"
    offer                             = "0001-com-ubuntu-server-jammy"
    sku                               = "22_04-lts"
    version                           = "latest"
  }
    vm3 = {
    "vm_name"                         = "vm03"
    "rg_name"                         = "rg_group1"
    "location"                        = "eastus"
    "size"                            = "Standard_F2"
    "admin_username"                  = "azureadmin"
    "passw"                           = "redhat@1234"
    "network_interface_name"          = "nic03"
    "disable_password_authentication" = "false"
    publisher                         = "Canonical"
    offer                             = "0001-com-ubuntu-server-jammy"
    sku                               = "22_04-lts"
    version                           = "latest"
  }
}