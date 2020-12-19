/**
 * # Networking module
 *
 * This module creates the base network that can be deployed on a Azure Region.
 *
 * # Description
 *
 * This module creates the `Resource Group` and deploys all the network
 * resources on this RG.
 *
 * # Resources
 *
 * The following resources are deployed by this module:
 * * Azure Resource Group
 * * Azure DDoS Protection Plan
 * * Azure Virtual Network
 * * Azure Subnet (for Management)
 * * Azure Subnet (for Backend)
 * * Azure Network Security Group (for Management subnet)
 * * Azure Network Security Group (for Backend subnet)
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

# resource group
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.rg_name
  tags     = merge(var.tags, var.custom_tags)
}

# DDoS protection plan
resource "azurerm_network_ddos_protection_plan" "ddospplan" {
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = var.ddos_protection_plan_name
  tags                = merge(var.tags, var.custom_tags)
}

# virtual network
resource "azurerm_virtual_network" "vnet" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = var.vnet_name
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.ddospplan.id
    enable = true
  }

  tags = merge(var.tags, var.custom_tags)
}

# network security groups
resource "azurerm_network_security_group" "nsg" {
  for_each            = var.subnets
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = each.value["nsg"]
}

# subnet
resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = each.key
  address_prefixes     = [each.value["address_prefixes"]]
}

# network security group association
resource "azurerm_subnet_network_security_group_association" "nsgassoc" {
  for_each                  = var.subnets
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  subnet_id                 = azurerm_subnet.subnet[each.key].id
}
