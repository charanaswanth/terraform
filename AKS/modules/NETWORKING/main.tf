resource "azurerm_virtual_network" "my_demo_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg
  address_space       = var.vnet_address
  encryption {
    enforcement = "AllowUnencrypted"
  }
  tags = var.tags
}

resource "azurerm_subnet" "my_demo_subnet" {
  name                              = var.subent_name
  resource_group_name               = var.rg
  virtual_network_name              = azurerm_virtual_network.my_demo_vnet.name
  address_prefixes                  = var.subent_address
  private_endpoint_network_policies = "Enabled"
  default_outbound_access_enabled   = false
}

resource "azurerm_network_security_group" "my_demo_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}


resource "azurerm_subnet_network_security_group_association" "my_demo_nsg_subnet_assc" {
  subnet_id                 = azurerm_subnet.my_demo_subnet.id
  network_security_group_id = azurerm_network_security_group.my_demo_nsg.id
}