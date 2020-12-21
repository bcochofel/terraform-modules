provider "azurerm" {
  features {}
}

module "networking" {
  source = "../../modules/azurerm_network"

  rg_name  = "rg-base-example-001"
  location = "northeurope"

  custom_tags = {
    Environment = "demo"
  }

  ddos_protection_plan_name = "ddospp-base-example-001"

  vnet_name     = "vnet-base-example-001"
  address_space = "10.0.0.0/16"
}
