output "resource_group_name" {
  value = module.networking.resource_group_name
}

output "location" {
  value = module.networking.location
}

output "vnet_name" {
  value = module.networking.vnet_name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "vnet_address_space" {
  value = module.networking.vnet_address_space
}

output "vnet_subnets" {
  value = module.networking.vnet_subnets
}

output "subnets_nsg" {
  value = module.networking.subnets_nsg
}
