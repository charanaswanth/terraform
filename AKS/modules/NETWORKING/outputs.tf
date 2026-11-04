output "vnetName" {
  value = azurerm_virtual_network.myDemoVnet.name
}

output "subnetName" {
  value = azurerm_subnet.myDemoSubnet.name
}