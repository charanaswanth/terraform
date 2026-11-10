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
}

variable "subnet_id"{
    type = string
}

variable "aks_service_address" {
  type = string
  default = "10.100.0.0/16"
  description = "Cluster Service address"
}

variable "aks_dns_address" {
  type = string
  default = "10.100.0.3"
  description = "Cluster DNS address"
}

variable "acr_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "aks_name" {
  type = string
  default = "my_demo_aks"
  description = "Project cluster"
}