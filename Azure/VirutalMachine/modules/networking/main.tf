resource "azurerm_virtual_network" "myDemoVnet" {
  name                = var.vnet
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "myDemoSubnet" {
  name                 = var.subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myDemoVnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "myDemoNic" {
  name                = "myDemoNIC"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.myDemoSubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "myDemoNSG" {
  name                = var.nsg
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "demorule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}