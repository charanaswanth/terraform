resource "azurerm_kubernetes_cluster" "my_demo_aks" {
  name                      = var.aks_name
  location                  = var.location
  resource_group_name       = var.rg
  dns_prefix                = "myDemoAKS-dns"
  automatic_upgrade_channel = "stable"
  node_os_upgrade_channel   = "NodeImage"
  private_cluster_enabled   = true
  sku_tier                  = "Free"
  oidc_issuer_enabled       = true
  workload_identity_enabled = true
  local_account_disabled    = true
  kubernetes_version = "1.34"

  key_vault_secrets_provider {
    secret_rotation_enabled = true
    secret_rotation_interval = "5m"
  }


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2ps_v6"
    os_sku     = "AzureLinux"
    zones      = ["1"]
    vnet_subnet_id = var.subnet_id
  }

  node_provisioning_profile {
    default_node_pools = "None"
    mode               = "Manual"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    network_plugin_mode = "overlay"
    service_cidr   = "10.100.0.0/16"
    dns_service_ip = "10.100.0.3"
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = var.ARM_TENANT_ID
  }

  maintenance_window_auto_upgrade {
    frequency   = "Weekly"
    interval    = 1
    duration    = 4
    day_of_week = "Saturday"
    start_time  = "01:00"
    utc_offset  = "+00:00"
  }

  maintenance_window_node_os {
    frequency   = "Weekly"
    interval    = 1
    duration    = 4
    day_of_week = "Sunday"
    start_time  = "01:00"
    utc_offset  = "+00:00"
  }

  monitor_metrics {
    
  }

  tags = var.tags
}


resource "azurerm_kubernetes_cluster_node_pool" "mydemonode" {
  name                  = "mydemonode"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.my_demo_aks.id
  vm_size               = "Standard_D2ps_v6"
  node_count            = 1
  os_sku                = "AzureLinux"
  vnet_subnet_id = var.subnet_id
  tags = var.tags
}

# resource "azurerm_user_assigned_identity" "myDemoAKS-mi" {
#   name                = "myDemoAKS-mi"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.myDemo.name
# }

resource "azurerm_role_assignment" "my_demo_role" {
  principal_id                     = azurerm_kubernetes_cluster.my_demo_aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}