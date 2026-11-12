#Root
env = "development"
rg  = "my-demo-dev"

# Networking
vnet_name      = "my-demo-vnet-dev"
vnet_address   = ["10.0.0.0/23"]
subent_name    = "my-demo-subnet-dev"
subent_address = ["10.0.1.0/24"]
nsg_name       = "my-demo-nsg-dev"

#ACR
sku = "Basic"

#AKS
aks_name            = "my-demo-aks-dev"
aks_service_address = "10.100.0.0/16"
aks_dns_address     = "10.100.0.3"
aks_dns_prefix      = "myDemoAKS-dns-dev"
aks_pod_address     = "10.244.0.0/16"
aks_sku             = "Free"