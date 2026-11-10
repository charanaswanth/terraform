resource "azurerm_container_registry" "my_demo_acr" {
  name                = var.acr_name
  resource_group_name = var.rg
  location            = var.location
  sku                 = var.sku
}