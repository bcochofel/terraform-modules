# Bastion module

This module creates a Bastion VM.

# Description

This module deploys a Bastion VM and Network Security Group
that allows SSH connection.

# Resources

The following resources are deployed by this module:
* Azure Resource Group
* Azure Subnet
* Azure Public IP
* Azure Network Security Group
* Azure Network Interface
* Azure Virtual Machine
* Azure Storage Account for VM diagnostics

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| azurerm | >= 2.41.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.41.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_tags | Custom tags that will be merged with the default tags. | `map(string)` | `{}` | no |
| location | Azure Location to create the resources. | `string` | n/a | yes |
| nic\_name | Network Interface name. | `string` | n/a | yes |
| nsg\_name | Network Security Group name. | `string` | n/a | yes |
| pip\_alloc\_method | Defines the allocation method for this IP address. | `string` | `"Static"` | no |
| pip\_name | Public IP name. | `string` | n/a | yes |
| pip\_sku | The SKU of the Public IP. | `string` | `"Basic"` | no |
| privip\_address\_allocation | The allocation method used for the Private IP Address. | `string` | `"Dynamic"` | no |
| rg\_name | Name of the Resource Group to create. | `string` | n/a | yes |
| snet\_addr\_prefixes | The address prefixes to use for the subnet. | `string` | n/a | yes |
| snet\_name | Name of the Subnet. | `string` | n/a | yes |
| ssh\_pubkey | SSH Public Key. | `string` | n/a | yes |
| tags | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | <pre>{<br>  "ManagedBy": "Terraform"<br>}</pre> | no |
| vm\_admin\_username | VM Administrator username. | `string` | `"adminuser"` | no |
| vm\_managed\_disk\_type | Specifies the type of Managed Disk which should be created. | `string` | `"Standard_LRS"` | no |
| vm\_name | Virtual Machine name. | `string` | n/a | yes |
| vm\_size | Specifies the size of the Virtual Machine. | `string` | `"Standard_DS1_v2"` | no |
| vnet\_name | Name of the Virtual Network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| public\_ip | Publi IP address. |
| vm\_name | Virtual Machine name. |
