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
  type        = string
  description = "Project Virtual Network"
}

variable "vnet_address" {
  type        = list(string)
  description = "Virtual Network IP address"
  validation {
    condition     = alltrue([for c in var.vnet_address : can(cidr_host(c, 0))])
    error_message = "Invalid VNet IP address"
  }
}

variable "subent_name" {
  type        = string
  description = "Project Subnet"
}

variable "subent_address" {
  type        = list(string)
  description = "Subnet IP address"
  validation {
    condition     = alltrue([for c in var.subent_address : can(cidr_host(c, 0))])
    error_message = "Invalid Subnet IP address"
  }
}

variable "nsg_name" {
  type        = string
  description = "Project Network SecurityGroup"
}