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
  description = "Project Virtual Network"
}

variable "vnet_address" {
  type = list(string)
  default = [ "10.0.0.0/23" ]
  description = "Virtual Network IP address"
}

variable "subent_name"{
    type = string
    default = "my_demo_subnet"
    description = "Project Subnet"
}

variable "subent_address" {
  type = list(string)
  default = [ "10.0.1.0/24" ]
  description = "Subnet IP address"
}

variable "nsg_name" {
  type = string
  default = "my_demo_nsg"
  description = "Project Network SecurityGroup"
}