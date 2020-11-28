## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| github | >= 2.8.0 |
| helm | >= 1.2.1 |
| kubernetes | >= 1.11.3 |
| null | >= 2.1.2 |
| tls | >= 2.1.1 |

## Providers

| Name | Version |
|------|---------|
| github | >= 2.8.0 |
| helm | >= 1.2.1 |
| kubernetes | >= 1.11.3 |
| null | >= 2.1.2 |
| tls | >= 2.1.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bin\_path | Directory to copy binary files (should be in your PATH and end with '/'). | `string` | `"~/bin/"` | no |
| bootstrap\_flux | Whether to bootstrap flux on k8s. | `bool` | `true` | no |
| bootstrap\_helm\_operator | Whether to bootstrap Helm Operator on k8s. | `bool` | `true` | no |
| flux\_spec\_chart | Flux spec chart options. | <pre>object({<br>    release_name  = string<br>    repository    = string<br>    chart_name    = string<br>    chart_version = string<br>  })</pre> | <pre>{<br>  "chart_name": "flux",<br>  "chart_version": "1.6.0",<br>  "release_name": "flux",<br>  "repository": "https://charts.fluxcd.io"<br>}</pre> | no |
| flux\_values\_file | Flux values files. | `string` | `""` | no |
| fluxcd\_namespace | Name for the fluxcd k8s namespace. | `string` | `"fluxcd"` | no |
| fluxcd\_secret\_name | Name for the fluxcd k8s secret. | `string` | `"fluxcd-secret"` | no |
| fluxctl\_version | Fluxctl binary version. | `string` | `"1.21.0"` | no |
| helm\_operator\_crd\_url | HelmRelease Custom Resource Definition URL | `string` | `"https://raw.githubusercontent.com/fluxcd/helm-operator/1.2.0/deploy/crds.yaml"` | no |
| helm\_operator\_spec\_chart | Helm Operator spec chart options. | <pre>object({<br>    release_name  = string<br>    repository    = string<br>    chart_name    = string<br>    chart_version = string<br>  })</pre> | <pre>{<br>  "chart_name": "helm-operator",<br>  "chart_version": "1.2.0",<br>  "release_name": "helm-operator",<br>  "repository": "https://charts.fluxcd.io"<br>}</pre> | no |
| helm\_operator\_values\_file | Helm Operator values files. | `string` | `""` | no |
| helm\_version | Helm binary version (>= v3.x). | `string` | `"3.4.1"` | no |
| helm\_whatup\_plugin\_url | Helm Whatup plugin URL (official). | `string` | `"https://github.com/bacongobbler/helm-whatup"` | no |
| install\_fluxctl | Whether to install fluxctl binary. | `bool` | `true` | no |
| install\_helm | Whether to install Helm binary. | `bool` | `true` | no |
| install\_helm\_whatup\_plugin | Whether to install Helm Whatup plugin. | `string` | `false` | no |
| manage\_github\_ssh\_pubkey | Whether to let the module manage Github SSH public key. | `bool` | `true` | no |
| sudo\_string | Use sudo to copy/delete files, eg: 'sudo' (should be passwordless). | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| git\_ssh\_pubkey | Generated SSH public key. |
