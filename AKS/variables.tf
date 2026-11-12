variable "env" {
  type        = string
  description = "Project environment"
}

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