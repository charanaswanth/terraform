variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnetName" {
  type = string
  default = "my_demo_vnet"
  description = "Project Virutal Network"
}

variable "subnetName"{
    type = string
    default = "my_demo_subnet"
    description = "Project Subnet"
}