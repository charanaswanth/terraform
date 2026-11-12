resource "azurerm_role_assignment" "admin_user" {
  scope                = azurerm_kubernetes_cluster.my_demo_aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = var.aks_admin_group_id
}

resource "azurerm_role_assignment" "dev_user" {
  scope                = azurerm_kubernetes_cluster.my_demo_aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = var.aks_developer_group_id
}

resource "azurerm_role_assignment" "admin_rbac" {
  scope                = azurerm_kubernetes_cluster.my_demo_aks.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = var.aks_admin_group_id 
}

resource "azurerm_role_assignment" "dev_rbac" {
  scope                = "${azurerm_kubernetes_cluster.my_demo_aks.id}/namespaces/demo"
  role_definition_name = "Azure Kubernetes Service RBAC Writer"
  principal_id         = var.aks_developer_group_id
}

resource "azurerm_role_assignment" "my_demo_role" {
  principal_id                     = azurerm_kubernetes_cluster.my_demo_aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}