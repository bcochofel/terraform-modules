output "resource_group_name" {
  description = "The Resource Group name"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "The location of the newly resources"
  value       = azurerm_resource_group.rg.location
}

output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet.address_space
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the new vNet"
  value       = azurerm_subnet.subnet
}

output "subnets_nsg" {
  description = "The ids of the network security groups"
  value       = azurerm_network_security_group.nsg
}
