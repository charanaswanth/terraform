resource "azurerm_container_registry" "myDemoACR" {
  name                = var.acrName
  resource_group_name = var.rg
  location            = var.location
  sku                 = "Basic"
}