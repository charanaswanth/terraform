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
  automatic_upgrade_channel = "patch"
  private_cluster_enabled   = true
  sku_tier                  = "Free"


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2ps_v6"
    os_sku = "AzureLinux"
    zones = [ "1" ]
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
    service_cidr = "10.1.0.0/27"
    dns_service_ip = "10.1.0.2"
    # network_plugin_mode = "overlay"
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
  os_sku = "AzureLinux"

  tags = {
    env     = "dev"
    project = "demo"
  }
}