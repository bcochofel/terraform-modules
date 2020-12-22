output "vm_name" {
  description = "Virtual Machine name."
  value       = azurerm_linux_virtual_machine.vm.name
}

output "public_ip" {
  description = "Publi IP address."
  value       = azurerm_public_ip.pip.ip_address
}
