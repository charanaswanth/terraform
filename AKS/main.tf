# Create a resource group
resource "azurerm_resource_group" "myDemo" {
  name     = "myDemo"
  location = "East US"
  tags = {
    env = "dev"
    project = "demo"
  }
}