variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "acr_name" {
  type        = string
  default     = "myDemoACR97"
  description = "Azure Container Registry name"
}

variable "sku" {
  type        = string
  description = "ACR service tier"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be Basic, Standard, or Premium."
  }
}