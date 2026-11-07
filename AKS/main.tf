resource "azurerm_resource_group" "myDemo" {
  name     = "myDemo"
  location = var.location
  tags = {
    env     = "dev"
    project = "demo"
  }
}

module "networking" {
  source   = "./modules/NETWORKING"
  location = var.location
  rg       = azurerm_resource_group.myDemo.name
}

module "acr" {
  source   = "./modules/ACR"
  location = var.location
  rg       = azurerm_resource_group.myDemo.name
}

module "aks" {
  source   = "./modules/AKS"
  location = var.location
  rg       = azurerm_resource_group.myDemo.name
  vnetName = module.networking.vnetName
  subnetID = module.networking.subnetID
  acrID    = module.acr.acrID
}
