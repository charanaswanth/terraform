# AKS Terraform

## Configure Azure authentication 

1. Create an Azure app registration in the Azure portal, go to **Microsoft Entra ID > App registrations** and create an app registration named `terraform-provisioner` with role **Cloud Application Administrator**.
2. Create a client secret under **Certificates & secrets** and store it securely.
3. Run below commands before `terraform init`
    ```sh
   export ARM_CLIENT_ID="xxxx-xxxx-xxxx-xxxx-xxxx"
   export ARM_CLIENT_SECRET="xxxx-xxxx-xxxx-xxxx-xxxx"
   export ARM_TENANT_ID="xxxx-xxxx-xxxx-xxxx-xxxx"
   export ARM_SUBSCRIPTION_ID="xxxx-xxxx-xxxx-xxxx-xxxx"
   ```
## Configure the state backend

1. Create a **Azure Blob Storage account** `tfbackend97` under **Resource Group** `tfrg`.
2. Enable below **Data Protection**
    -  Enable soft delete for blobs - 7 days
    -  Enable soft delete for containers - 7 days
    -  Enable versioning for blobs - Infinite
3. Go to **Access control (IAM) > Add role assignment**. Assign **Storage Blob Data Contributor** role to the `terraform-provisioner` service principal. This grants access to the `tfstate` container used by the Terraform backend.
4. Run `terraform init`.