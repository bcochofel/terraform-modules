provider "azurerm" {
  features {}
}

module "networking" {
  source = "../../modules/azurerm_network"

  rg_name  = "base-net-rg"
  location = "northeurope"

  custom_tags = {
    Environment = "demo"
  }

  ddos_protection_plan_name = "ddospplan"

  vnet_name     = "base-vnet"
  address_space = "10.0.0.0/16"
}
