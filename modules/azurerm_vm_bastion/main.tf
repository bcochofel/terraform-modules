/**
 * # Bastion module
 *
 * This module creates a Bastion VM.
 *
 * # Description
 *
 * This module deploys a Bastion VM and Network Security Group
 * that allows SSH connection.
 *
 * # Resources
 *
 * The following resources are deployed by this module:
 * * Azure Resource Group
 * * Azure Subnet
 * * Azure Public IP
 * * Azure Network Security Group
 * * Azure Network Interface
 * * Azure Virtual Machine
 * * Azure Storage Account for VM diagnostics
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

# subnet
resource "azurerm_subnet" "snet" {
  name                 = var.snet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.snet_addr_prefixes]
}

# public ip
resource "azurerm_public_ip" "pip" {
  allocation_method   = var.pip_alloc_method
  sku                 = var.pip_sku
  location            = azurerm_resource_group.rg.location
  name                = var.pip_name
  resource_group_name = azurerm_resource_group.rg.name
  tags                = merge(var.tags, var.custom_tags)
}

# network security group and rules
resource "azurerm_network_security_group" "nsg" {
  location            = azurerm_resource_group.rg.location
  name                = var.nsg_name
  resource_group_name = azurerm_resource_group.rg.name
  tags                = merge(var.tags, var.custom_tags)

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# network interface
resource "azurerm_network_interface" "nic" {
  location            = azurerm_resource_group.rg.location
  name                = var.nic_name
  resource_group_name = azurerm_resource_group.rg.name
  tags                = merge(var.tags, var.custom_tags)

  ip_configuration {
    name                          = "${var.nic_name}conf"
    private_ip_address_allocation = var.privip_address_allocation
    subnet_id                     = azurerm_subnet.snet.id
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# connect security group to the network interface
resource "azurerm_network_interface_security_group_association" "nicnsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}

# create storage account for boot diagnostics
resource "azurerm_storage_account" "st" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(var.tags, var.custom_tags)
}

# create virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size
  tags                  = merge(var.tags, var.custom_tags)

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_name}disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vm_managed_disk_type
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.vm_admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("~/.ssh/id_rsa.pub")
      path     = "/home/{username}/.ssh/authorized_keys"
    }
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = azurerm_storage_account.st.primary_blob_endpoint
  }
}
