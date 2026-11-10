resource "azurerm_virtual_network" "my_demo_vnet" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = var.rg
  address_space       = ["10.0.0.0/23"]
  encryption {
    enforcement = "AllowUnencrypted"
  }
  tags = var.tags
}

resource "azurerm_subnet" "my_demo_subnet" {
  name                              = var.subnetName
  resource_group_name               = var.rg
  virtual_network_name              = azurerm_virtual_network.my_demo_vnet.name
  address_prefixes                  = ["10.0.1.0/24"]
  private_endpoint_network_policies = "Enabled"
  default_outbound_access_enabled   = false
}