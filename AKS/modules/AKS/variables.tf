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

variable "subnet_id" {
  type = string
}

variable "aks_service_address" {
  type        = string
  description = "Cluster Service address"
}

variable "aks_dns_address" {
  type        = string
  description = "Cluster DNS address"
}

variable "aks_pod_address" {
  type        = string
  description = "Cluster Pod address"
}

variable "aks_dns_prefix" {
  type        = string
  description = "DNS prefix atached to cluster DNS"
}

variable "aks_sku" {
  type        = string
  description = "AKS plan tier"
  validation {
    condition     = condition(["Free", "Standard", "Premium"], var.aks_sku)
    error_message = "SKU tier must be Free, Standard or Premium"
  }
}

variable "acr_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "aks_name" {
  type        = string
  description = "Project cluster"
}

variable "aks_admin_group_id" {
  type        = string
  default     = "62d5095b-5ed7-429c-910e-c025dbea68e4"
  description = "Admin Group with cluster level accesss"
}

variable "aks_developer_group_id" {
  type        = string
  default     = "29d6bfe0-e201-4c91-bb97-1acb6883d971"
  description = "Developer Group with namespace level access"
}