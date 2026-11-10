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

variable "aks_admin_group_id" {
  type = string
  default = "62d5095b-5ed7-429c-910e-c025dbea68e4"
  description = "Admin Group with cluster level accesss"
}

variable "aks_developer_group_id" {
  type = string
  default = "29d6bfe0-e201-4c91-bb97-1acb6883d971"
  description = "Developer Group with namespace level access"
}