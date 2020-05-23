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
| bootstrap\_helm\_operator | Whether to bootstrap Helm Operator on k8s. | `bool` | `true` | no |
| fluxcd\_namespace | Name for the fluxcd k8s namespace. | `string` | `"fluxcd"` | no |
| fluxcd\_secret\_name | Name for the fluxcd k8s secret. | `string` | `"fluxcd-secret"` | no |
| helm\_operator\_crd\_url | HelmRelease Custom Resource Definition URL | `string` | `"https://raw.githubusercontent.com/fluxcd/helm-operator/1.1.0/deploy/crds.yaml"` | no |
| helm\_operator\_helm\_versions | Helm Operator helm.versions parameter. | `string` | `"v3"` | no |
| helm\_operator\_spec\_chart | Helm Operator spec chart options. | <pre>object({<br>    release_name  = string<br>    repository    = string<br>    chart_name    = string<br>    chart_version = string<br>  })</pre> | <pre>{<br>  "chart_name": "helm-operator",<br>  "chart_version": "1.0.2",<br>  "release_name": "helm-operator",<br>  "repository": "https://charts.fluxcd.io"<br>}</pre> | no |
| helm\_version | Helm binary version (>= v3.x). | `string` | `"3.1.2"` | no |
| helm\_whatup\_plugin\_url | Helm Whatup plugin URL (official). | `string` | `"https://github.com/bacongobbler/helm-whatup"` | no |
| install\_helm | Whether to install Helm binary. | `bool` | `true` | no |
| install\_helm\_whatup\_plugin | Whether to install Helm Whatup plugin. | `string` | `false` | no |
| manage\_github\_ssh\_pubkey | Whether to let the module manage Github SSH public key. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| git\_ssh\_pubkey | Generated SSH public key. |
