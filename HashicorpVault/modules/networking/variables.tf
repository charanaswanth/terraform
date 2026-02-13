variable "location" {
    description = "Resources location"
    type = string
}

variable "vnet" {
    description = "Virtual Network"
    type = string
}

variable "subnet" {
    description = "Subnet"
    type = string
}

variable "resource_group_name"{
    description = "Name of the resource group"
    type = string
}

variable "nsg"{
    description = "NSG to allow ssh"
    type = string
}