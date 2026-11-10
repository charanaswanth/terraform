output "vnet_name" {
  value = azurerm_virtual_network.my_demo_vnet
}

output "subnet_id" {
  value = azurerm_subnet.my_demo_subnet
}