# Hashicorp Vault  
Vault is used to store and manage secrets with identity based security
  
## Setup 🚀  

1. Install vault package

```sh
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vault
```

2. Start Vault server in dev mode

```sh
vault server -dev
```

3. Copy and save the unseal key and root token from the terminal

4. Access the vault page (localhost:8200)

![alt text](vault.png)

5. Login vault with root token

## Save SSH key in Vault 🚀 

1. Export vault address and token
```sh
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="<root_token>"
```

2. Create kv secret engine and add the ssh_key as value

3. Validate the kv creation
```sh
vault kv get -mount="kv" "ssh"
```

## Use it in terraform 🚀 

1. Add vault under provider

```sh
terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "5.7.0"
    }
  }
}
```

2. Read SSH key from vault and use it in moduel

```sh
data "vault_kv_secret_v2" "ssh_key" {
  mount = "secret"
  name  = "ssh"
}
```