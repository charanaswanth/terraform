variable "vm" {
    description = "Virtual Machine"
    type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Resource location"
  type        = string
}

variable "azurerm_network_interface" {
    description = "Azure NIC"
    type = list(string)
}