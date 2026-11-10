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

variable "acr_id" {
  type = string
}

variable "ARM_TENANT_ID" {
  type = string
}

variable "aks_name" {
  type = string
  default = "my_demo_aks"
  description = "Project cluster"
}