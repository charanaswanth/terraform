output "vnetName" {
  value = azurerm_virtual_network.myDemoVnet.name
}

output "subnetID" {
  value = azurerm_subnet.myDemoSubnet.id
}