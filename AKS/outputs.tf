output "rg" {
  value = azurerm_resource_group.my_demo.name
}
output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}