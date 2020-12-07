provider "azurerm" {
  features {}
}

module "networking" {
  source = "../../modules/azurerm_network"

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
