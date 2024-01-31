module "resource_group" {
  source = "../../Module/ResourceGroup"
  rg     = var.rgs
}

# The below module for virtual Network
module "virtualnetwork" {
  source     = "../../Module/VirtualNetwork"
  vnet       = var.vnets
  depends_on = [module.resource_group]
}

# The below code for subnet
module "subnet" {
  source     = "../../Module/Subnet"
  subnets    = var.subnets
  depends_on = [module.resource_group, module.virtualnetwork]
}
#The Public IP
module "public_ip" {
  source     = "../../Module/Pulic_IP"
  ipaddress  = var.ipaddress
  depends_on = [module.resource_group]
}
#The Below code is for NSG
module "ntwrk_security" {
  source     = "../../Module/NSG"
  nsg        = var.nsg
  security   = var.security
  depends_on = [module.resource_group]
}
##The NIC Card

module "interface_card" {
  source      = "../../Module/NIC_CARD"
  networkcard = var.networkcard
  depends_on  = [module.resource_group, module.subnet]
}

##NIC Card associate with NSG
module "nsgassnic" {
  source     = "../../Module/NIC_ASSOCIATE_NSG"
  nicnsgmap  = var.nicnsgmap
  depends_on = [module.interface_card, module.ntwrk_security]
}

###Azure Bastion
module "azurebastion" {
  source     = "../../Module/AzureBastion"
  depends_on = [module.subnet, module.public_ip]
}
###VMS
module "vms_s" {
  source     = "../../Module/VMs"
  vmlinux    = var.vmlinux
  depends_on = [module.resource_group, module.virtualnetwork, module.interface_card]
}