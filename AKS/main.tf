locals {
  project_tags = {
    env     = "dev"
    project = "demo"
  }
}

resource "azurerm_resource_group" "my_demo" {
  name     = var.rg
  location = var.location
  tags     = local.project_tags
}

module "networking" {
  source   = "./modules/NETWORKING"
  location = var.location
  rg       = azurerm_resource_group.my_demo.name
  tags     = local.project_tags
}

module "acr" {
  source   = "./modules/ACR"
  location = var.location
  rg       = azurerm_resource_group.my_demo.name
  # tags = local.tags
}

module "aks" {
  source        = "./modules/AKS"
  location      = var.location
  rg            = azurerm_resource_group.my_demo.name
  vnet_name     = module.networking.vnet_name
  subnet_id     = module.networking.subnet_id
  acr_id        = module.acr.acr_id
  ARM_TENANT_ID = var.ARM_TENANT_ID
  tags          = local.project_tags
}
