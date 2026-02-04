
# Terraform - Azure

## Azure Service Principal

```sh
az login
az account list
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscriptionID>"
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID
```

## Export Credentials
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"

## Terraform dir structure

```sh
terraform-azure-vm/
├── envs/
│   └── terraform.tfvars
│
├── modules/
│   ├── rg/
│   ├── networking/
│   └── vm/
│
├── main.tf
├── provider.tf
├── versions.tf
└── variables.tf
```
## Backend config

Create Blob storage in Azure with container

```sh
backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = "" # blob name
    container_name       = ""
    key                  = "" # path to terraform state gile
  }
```