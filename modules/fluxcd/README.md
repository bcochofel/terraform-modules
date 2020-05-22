## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| github | >= 2.8.0 |
| helm | >= 1.2.1 |
| kubernetes | >= 1.11.3 |

## Providers

| Name | Version |
|------|---------|
| github | >= 2.8.0 |
| helm | >= 1.2.1 |
| kubernetes | >= 1.11.3 |
| null | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bootstrap\_helm\_operator | Whether to bootstrap Helm Operator on k8s. | `bool` | `true` | no |
| fluxcd\_namespace | Name for the fluxcd k8s namespace. | `string` | `"fluxcd"` | no |
| fluxcd\_secret\_name | Name for the fluxcd k8s secret. | `string` | `"fluxcd-secret"` | no |
| github\_token | GitHub personal access token | `string` | n/a | yes |
| helm\_operator\_crd\_url | HelmRelease Custom Resource Definition URL | `string` | `"https://raw.githubusercontent.com/fluxcd/helm-operator/1.1.0/deploy/crds.yaml"` | no |
| helm\_operator\_helm\_versions | Helm Operator helm.versions parameter. | `string` | `"v3"` | no |
| helm\_operator\_spec\_chart | Helm Operator spec chart options. | <pre>object({<br>    release_name  = string<br>    repository    = string<br>    chart_name    = string<br>    chart_version = string<br>  })</pre> | <pre>{<br>  "chart_name": "helm-operator",<br>  "chart_version": "1.0.2",<br>  "release_name": "helm-operator",<br>  "repository": "https://charts.fluxcd.io"<br>}</pre> | no |
| kubectl\_config\_path | Path to the kube config file. | `string` | `"~/.kube/config"` | no |
| kubectl\_context | Kube context to choose from the config file. | `string` | n/a | yes |
| manage\_github\_ssh\_pubkey | Whether to let the module manage Github SSH public key. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| git-ssh-public-key | Generated SSH public key. |
