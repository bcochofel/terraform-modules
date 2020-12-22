/**
 * # Virtual Network Peering
 *
 * This module creates peering between 2 vNets
 */

terraform {
  required_version = ">= 0.12.20"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.41.0"
    }
  }
}

# vnet 1 peer to vnet 2
resource "azurerm_virtual_network_peering" "peer1to2" {
  name                      = "peer1to2"
  remote_virtual_network_id = var.vnet2_id
  resource_group_name       = var.vnet1_rg
  virtual_network_name      = var.vnet1_name
}

# vnet 2 peer to vnet 1
resource "azurerm_virtual_network_peering" "peer2to1" {
  name                      = "peer2to1"
  remote_virtual_network_id = var.vnet1_id
  resource_group_name       = var.vnet2_rg
  virtual_network_name      = var.vnet2_name
}
