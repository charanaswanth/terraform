resource "azurerm_virtual_network" "myDemoVnet" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = var.rg
  address_space       = ["10.0.0.0/23"]
  encryption {
    enforcement = "AllowUnencrypted"
  }
  tags = {
    env     = "dev"
    project = "demo"
  }
}

resource "azurerm_subnet" "myDemoSubnet" {
  name                              = "myDemoSubnet"
  resource_group_name               = var.rg
  virtual_network_name              = azurerm_virtual_network.myDemoVnet.name
  address_prefixes                  = ["10.0.1.0/24"]
  private_endpoint_network_policies = "Enabled"
  default_outbound_access_enabled   = false
}