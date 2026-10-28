# Create a resource group
resource "azurerm_resource_group" "myDemo" {
  name     = "myDemo"
  location = var.location
  tags = {
    env     = "dev"
    project = "demo"
  }
}

resource "azurerm_virtual_network" "myDemoVnet" {
  name                = "myDemoVnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.myDemo.name
  address_space       = ["10.0.0.0/23"]
  encryption {
    enforcement = "AllowUnencrypted"
  }
  tags = {
    env     = "dev"
    project = "demo"
  }
}

resource "azurerm_subnet" "myDemoSubnet" {
  name                              = "myDemoSubnet"
  resource_group_name               = azurerm_resource_group.myDemo.name
  virtual_network_name              = azurerm_virtual_network.myDemoVnet.name
  address_prefixes                  = ["10.0.1.0/27"]
  private_endpoint_network_policies = "Enabled"
  default_outbound_access_enabled   = false
}

resource "azurerm_user_assigned_identity" "myDemoAKS-mi" {
  name                = "myDemoAKS-mi"
  location            = var.location
  resource_group_name = azurerm_resource_group.myDemo.name
}

resource "azurerm_kubernetes_cluster" "myDemoAKS" {
  name                      = "myDemoAKS"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.myDemo.name
  dns_prefix                = "myDemoAKS-dns"
  automatic_upgrade_channel = "stable"
  node_os_upgrade_channel   = "NodeImage"
  private_cluster_enabled   = false
  sku_tier                  = "Free"
  oidc_issuer_enabled       = false
  local_account_disabled    = true


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2ps_v6"
    os_sku     = "AzureLinux"
    zones      = ["1"]
    vnet_subnet_id = azurerm_subnet.myDemoSubnet.id
  }

  node_provisioning_profile {
    default_node_pools = "None"
    mode               = "Manual"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
    service_cidr   = "10.1.0.0/27"
    dns_service_ip = "10.1.0.2"
    outbound_type  = "userDefinedRouting"
    # network_plugin_mode = "overlay"
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = "0d3db525-3539-49f8-bb5b-ce4549690e13"
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


  tags = {
    env     = "dev"
    project = "demo"
  }
}


resource "azurerm_kubernetes_cluster_node_pool" "mydemonode" {
  name                  = "mydemonode"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.myDemoAKS.id
  vm_size               = "Standard_D2ps_v6"
  node_count            = 1
  os_sku                = "AzureLinux"
  vnet_subnet_id = azurerm_subnet.myDemoSubnet.id

  tags = {
    env     = "dev"
    project = "demo"
  }
}