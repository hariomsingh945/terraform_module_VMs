variable "nsg" {
    type = map(object({
      nsg_name = string
      location = string
      rg_name = string
    }))
}

variable "security" {

}