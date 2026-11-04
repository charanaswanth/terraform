variable "rg" {
  type = string
}

variable "location" {
    type = string
}

variable "vnetName" {
  type = string
  default = "myDemoVnet"
}

variable "subnetName"{
    type = string
    default = "myDemoSubnet"
}