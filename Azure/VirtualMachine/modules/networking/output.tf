output "azurerm_network_interface"{
    description = "MyDemo NIC"
    value = azurerm_network_interface.myDemoNic.id
}

output "azurerm_public_ip" {
    description = "MydemoIP"
    value = azurerm_public_ip.myDemoIp.ip_address
}