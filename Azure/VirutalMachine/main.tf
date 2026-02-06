module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source              = "./modules/networking"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  subnet              = var.subnet
  vnet                = var.vnet
  nsg                 = var.nsg
}

module "vm" {
  source                    = "./modules/virtualMachine"
  location                  = var.location
  vm                        = var.vm
  resource_group_name       = module.rg.resource_group_name
  azurerm_network_interface = [module.network.azurerm_network_interface]
}


# resource "azurerm_public_ip" "bastionIp" {
#   name                = "bastionIp"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }
# resource "azurerm_bastion_host" "demoBastion" {
#   name                = "myDemoBastion"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                 = "configuration"
#     subnet_id            = azurerm_subnet.example.id
#     public_ip_address_id = azurerm_public_ip.example.id
#   }
# }