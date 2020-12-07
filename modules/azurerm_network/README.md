# Networking module

This module creates the base network that can be deployed on a Azure Region.

# Description

This module creates the `Resource Group` and deploys all the network
resources on this RG.

# Resources

The following resources are deployed by this module:
* Azure Resource Group
* Azure DDoS Protection Plan
* Azure Virtual Network
* Azure Subnet (for Management)
* Azure Subnet (for Backend)
* Azure Network Security Group (for Management subnet)
* Azure Network Security Group (for Backend subnet)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| azurerm | ~> 2.30.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.30.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | Address space to be used with vNet. | `string` | `"10.0.0.0/16"` | no |
| custom\_tags | Custom tags that will be merged with the default tags. | `map(string)` | `{}` | no |
| ddos\_protection\_plan\_name | Name of the DDOS Protection Plan to create. | `string` | `"ddospplan"` | no |
| dns\_servers | The DNS servers to be used with vNet. | `list(string)` | `[]` | no |
| location | Azure Location to create the resources. | `string` | `"North Europe"` | no |
| rg\_name | Name of the Resource Group to create. | `string` | `"base-net-rg"` | no |
| subnets | Subnets configuration<pre>hcl<br>subnets = {<br>  subnet1 = {<br>    address_prefixes = "10.0.1.0/24",<br>    nsg              = "nsgsubnet1"<br>  },<br>  subnet2 = {<br>    address_prefixes = "10.0.2.0/24",<br>    nsg              = "nsgsubnet2"<br>  }<br>}</pre> | <pre>map(object({<br>    address_prefixes = string<br>    nsg              = string<br>  }))</pre> | <pre>{<br>  "subnet1": {<br>    "address_prefixes": "10.0.1.0/24",<br>    "nsg": "nsgsubnet1"<br>  }<br>}</pre> | no |
| tags | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | <pre>{<br>  "ManagedBy": "Terraform"<br>}</pre> | no |
| vnet\_name | Name of the Virtual Network to create. | `string` | `"base-vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| subnets\_nsg | The ids of the network security groups |
| vnet\_address\_space | The address space of the newly created vNet |
| vnet\_id | The id of the newly created vNet |
| vnet\_location | The location of the newly created vNet |
| vnet\_name | The Name of the newly created vNet |
| vnet\_subnets | The ids of subnets created inside the new vNet |
