variable "subnets" {
  type = map(object({
    subnet_name       = string
    rg_name           = string
    network_name      = string
    address_prefixes1 = list(string)
  }))
}
