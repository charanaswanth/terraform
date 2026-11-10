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

# variable "tenant_id" {
#   type        = string
#   description = "Project tenant ID"
# }