provider "azurerm" {
  features {}
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "bastion" {
  source = "../../modules/azurerm_vm_bastion"

  rg_name  = "rg-bastion-example-001"
  location = "northeurope"

  custom_tags = {
    Environment = "example"
  }

  vnet_name          = "vnet-base-example-001"
  vnet_rg            = "rg-base-example-001"
  nic_name           = "nic-bastion-example-001"
  nsg_name           = "nsg-bastion-example-001"
  pip_name           = "pip-bastion-example-001"
  snet_name          = "snet-bastion-example-001"
  snet_addr_prefixes = "10.0.1.0/24"
  vm_name            = "vm-bastion-example-001"

  vm_admin_username = "adminuser"
  ssh_pubkey        = tls_private_key.example_ssh.public_key_openssh
}
