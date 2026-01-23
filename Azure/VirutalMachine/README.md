Create Service Principal and Client Secret to authenticate

az login
az account list
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscriptionID>"


az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID


# sh
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"

terraform-azure-vm/
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── versions.tf
