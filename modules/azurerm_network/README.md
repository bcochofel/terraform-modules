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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| azurerm | >= 2.41.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.41.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | Address space to be used with vNet. | `string` | n/a | yes |
| custom\_tags | Custom tags that will be merged with the default tags. | `map(string)` | `{}` | no |
| ddos\_protection\_plan\_name | Name of the DDOS Protection Plan to create. | `string` | n/a | yes |
| dns\_servers | The DNS servers to be used with vNet. | `list(string)` | `[]` | no |
| location | Azure Location to create the resources. | `string` | n/a | yes |
| rg\_name | Name of the Resource Group to create. | `string` | n/a | yes |
| tags | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | <pre>{<br>  "ManagedBy": "Terraform"<br>}</pre> | no |
| vnet\_name | Name of the Virtual Network to create. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| location | The location of the newly resources |
| resource\_group\_name | The Resource Group name |
| vnet\_address\_space | The address space of the newly created vNet |
| vnet\_id | The id of the newly created vNet |
| vnet\_name | The Name of the newly created vNet |
