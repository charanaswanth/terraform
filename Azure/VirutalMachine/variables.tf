variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Resource location"
  type        = string
}

variable "vnet" {
  description = "Virtual Network"
  type        = string
}

variable "subnet" {
  description = "Subnet"
  type        = string
}

variable "nsg" {
  description = "NSG to allow ssh"
  type        = string
}

variable "vm" {
  description = "Virtual Machine"
  type        = string
}