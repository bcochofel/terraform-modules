# Virtual Network Peering

This module creates peering between 2 vNets

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
| vnet1\_id | Virtual Network #1 id. | `string` | n/a | yes |
| vnet1\_name | Virtual Network #1 name. | `string` | n/a | yes |
| vnet1\_rg | Virtual Network #1 resource group. | `string` | n/a | yes |
| vnet2\_id | Virtual Network #2 id. | `string` | n/a | yes |
| vnet2\_name | Virtual Network #2 name. | `string` | n/a | yes |
| vnet2\_rg | Virtual Network #2 resource group. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| peer1to2\_id | n/a |
| peer2to1\_id | n/a |
