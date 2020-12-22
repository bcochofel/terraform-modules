provider "azurerm" {
  features {}
}

module "bastion" {
  source = "../../modules/azurerm_vm_bastion"

  rg_name  = "rg-bastion-example-001"
  location = "northeurope"

  custom_tags = {
    Environment = "example"
  }

  vnet_name          = "vnet-base-example-001"
  nic_name           = "nic-bastion-example-001"
  nsg_name           = "nsg-bastion-example-001"
  pip_name           = "pip-bastion-example-001"
  snet_name          = "snet-bastion-example-001"
  snet_addr_prefixes = "10.0.1.0/24"
  vm_name            = "vm-bastion-example-001"
}
