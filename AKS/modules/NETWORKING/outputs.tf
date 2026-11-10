output "vnet_name" {
  value = azurerm_virtual_network.my_demo_vnet.name
}

output "subnet_id" {
  value = azurerm_subnet.my_demo_subnet.id
}