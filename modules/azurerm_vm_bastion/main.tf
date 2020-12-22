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
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0.0"
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
  resource_group_name  = var.vnet_rg
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
  name                     = "stdiag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(var.tags, var.custom_tags)
}

# create linux virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  admin_username                  = var.admin_ssh_key.username
  location                        = azurerm_resource_group.rg.location
  name                            = var.vm_name
  network_interface_ids           = [azurerm_network_interface.nic.id]
  resource_group_name             = azurerm_resource_group.rg.name
  size                            = var.vm_size
  disable_password_authentication = true

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

  admin_ssh_key {
    username   = var.admin_ssh_key.username
    public_key = var.admin_ssh_key.public_key
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.st.primary_blob_endpoint
  }

  source_image_reference {
    publisher = var.vm_image.publisher
    offer     = var.vm_image.offer
    sku       = var.vm_image.sku
    version   = var.vm_image.version
  }

  tags = merge(var.tags, var.custom_tags)
}
