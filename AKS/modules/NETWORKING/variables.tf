variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet_name" {
  type = string
  default = "my_demo_vnet"
  description = "Project Virutal Network"
}

variable "subent_name"{
    type = string
    default = "my_demo_subnet"
    description = "Project Subnet"
}

variable "nsg_name" {
  type = string
  default = "my_demo_nsg"
  description = "Project Network SecurityGroup"
}