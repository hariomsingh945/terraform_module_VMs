variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tag      = optional(map(string))
  }))
}

## The below code for vnets variable
variable "vnets" {
  type = map(object({
    name          = string
    location      = string
    rg_name       = string
    address_space = list(string)
  }))
}

## The below code is for "subnet" variable

variable "subnets" {
  type = map(object({
    subnet_name       = string
    rg_name           = string
    network_name      = string
    address_prefixes1 = list(string)
  }))
}

#the below Public IP

variable "ipaddress" {

}

#The NSG
variable "nsg" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
  }))
}
variable "security" {
}
#THE NIC Card
variable "networkcard" {
}

##NIC Card And NSG MAP
variable "nicnsgmap" {
}
##Azure bastion no variable

##VMS
variable "vmlinux" {
}