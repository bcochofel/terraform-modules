## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| kubernetes | >= 1.11.3 |
| null | >= 2.1.2 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.11.3 |
| null | >= 2.1.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bin\_path | Directory to copy binary files (should be in your PATH and end with '/'). | `string` | `"~/bin/"` | no |
| istio\_version | Istio version. | `string` | `"1.5.2"` | no |
| kiali\_passphrase | Kiali passphrase for authentication | `string` | `"password"` | no |
| kiali\_username | Kiali username for authentication | `string` | `"admin"` | no |
| kubectl\_context | kubectl config context to apply Istio (kubectl should be in your PATH). | `string` | n/a | yes |
| profile | Istio profile. | `string` | `"default"` | no |
| sudo\_string | Use sudo to copy/delete files, eg: 'sudo' (should be passwordless). | `string` | `""` | no |
| values\_file | Custom values file for Istio installation | `string` | `""` | no |

## Outputs

No output.
