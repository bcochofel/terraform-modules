variable "rg_name" {
  description = "Name of the Resource Group to create."
  type        = string
}

variable "location" {
  description = "Azure Location to create the resources."
  type        = string
}

variable "tags" {
  description = <<EOD
A mapping of tags which should be assigned to the Resource Group.
EOD
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}

variable "custom_tags" {
  description = "Custom tags that will be merged with the default tags."
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "vnet_rg" {
  description = "vNet Resource Group name."
  type        = string
}

variable "snet_name" {
  description = "Name of the Subnet."
  type        = string
}

variable "snet_addr_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = string
}

variable "pip_name" {
  description = "Public IP name."
  type        = string
}

variable "pip_alloc_method" {
  description = "Defines the allocation method for this IP address."
  type        = string
  default     = "Static"
}

variable "pip_sku" {
  description = "The SKU of the Public IP."
  type        = string
  default     = "Basic"
}

variable "nsg_name" {
  description = "Network Security Group name."
  type        = string
}

variable "nic_name" {
  description = "Network Interface name."
  type        = string
}

variable "privip_address_allocation" {
  description = "The allocation method used for the Private IP Address."
  type        = string
  default     = "Dynamic"
}

variable "vm_name" {
  description = "Virtual Machine name."
  type        = string
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "os_disk" {
  description = "Type of disk for the OS."
  type        = map(string)
  default = {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

variable "admin_ssh_key" {
  description = "Administrator credentials."
  type        = map(string)
  default = {
    username   = "adminuser"
    public_key = ""
  }
}

variable "vm_image" {
  description = "Source Image for the Linux."
  type        = map(string)
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
