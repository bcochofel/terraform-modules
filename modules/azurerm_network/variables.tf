variable "rg_name" {
  description = "Name of the Resource Group to create."
  type        = string
  default     = "base-net-rg"
}

variable "location" {
  description = "Azure Location to create the resources."
  type        = string
  default     = "North Europe"
}

variable "tags" {
  type        = map(string)
  description = <<EOD
A mapping of tags which should be assigned to the Resource Group.
EOD
  default = {
    ManagedBy = "Terraform"
  }
}

variable "custom_tags" {
  type        = map(string)
  description = "Custom tags that will be merged with the default tags."
  default     = {}
}

variable "ddos_protection_plan_name" {
  description = "Name of the DDOS Protection Plan to create."
  type        = string
  default     = "ddospplan"
}

variable "vnet_name" {
  description = "Name of the Virtual Network to create."
  type        = string
  default     = "base-vnet"
}

variable "address_space" {
  description = "Address space to be used with vNet."
  type        = string
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = <<EOD
Subnets configuration

```hcl
subnets = {
  subnet1 = {
    address_prefixes = "10.0.1.0/24",
    nsg              = "nsgsubnet1"
  },
  subnet2 = {
    address_prefixes = "10.0.2.0/24",
    nsg              = "nsgsubnet2"
  }
}
```
EOD
  type = map(object({
    address_prefixes = string
    nsg              = string
  }))
  default = {
    subnet1 = {
      address_prefixes = "10.0.1.0/24",
      nsg              = "nsgsubnet1"
    }
  }
}