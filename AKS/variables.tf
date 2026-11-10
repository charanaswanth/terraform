variable "location" {
  default     = "East US"
  type        = string
  description = "Project location"
}

variable "rg" {
  default     = "my_demo"
  type        = string
  description = "Project resource group"
}

variable "ARM_TENANT_ID" {
  type        = string
  description = "Project tenant ID"
}