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

# module "vm" {
#   source                    = "./modules/virtualMachine"
#   location                  = var.location
#   vm                        = var.vm
#   resource_group_name       = module.rg.resource_group_name
#   azurerm_network_interface = [module.network.azurerm_network_interface]
# }
