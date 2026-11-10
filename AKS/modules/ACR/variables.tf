variable "rg" {
  type = string
}

variable "location" {
    type = string
}

variable "acr_name" {
  type = string
  default = "myDemoACR97"
  description = "Azure Container Registry name"
}

variable "sku" {
  type = string
  default = "Basic"
  description = "ACR service tier"
}