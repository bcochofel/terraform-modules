provider "azurerm" {
  features {}
}

resource "random_string" "salt" {
  length  = 4
  special = false
  upper   = false
}

module "networking" {
  source = "../../modules/azurerm_network"

  rg_name  = "base-net-rg-${random_string.salt.result}"
  location = "North Europe"

  custom_tags = {
    Environment = "demo"
  }

  ddos_protection_plan_name = "ddospplan-${random_string.salt.result}"

  vnet_name     = "base-vnet-${random_string.salt.result}"
  address_space = "10.0.0.0/16"

  subnets = {
    management = {
      address_prefixes = "10.0.1.0/24",
      nsg              = "nsgmgmt"
    },
    backend = {
      address_prefixes = "10.0.2.0/24",
      nsg              = "nsgbackend"
    }
  }
}
