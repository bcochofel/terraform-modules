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
| bootstrap\_flux | Whether to bootstrap flux on k8s. | `bool` | `true` | no |
| bootstrap\_fluxcloud | Whether to bootstrap fluxcloud sidecar. | `bool` | `true` | no |
| bootstrap\_helm\_operator | Whether to bootstrap Helm Operator on k8s. | `bool` | `true` | no |
| flux\_git\_values | Flux git chart values. | <pre>object({<br>    git_url          = string<br>    git_readonly     = bool<br>    git_branch       = string<br>    git_path         = string<br>    git_user         = string<br>    git_email        = string<br>    git_pollInterval = string<br>    git_timeout      = string<br>  })</pre> | <pre>{<br>  "git_branch": "master",<br>  "git_email": "support@weave.works",<br>  "git_path": "",<br>  "git_pollInterval": "5m",<br>  "git_readonly": false,<br>  "git_timeout": "20s",<br>  "git_url": "",<br>  "git_user": "Weave Flux"<br>}</pre> | no |
| flux\_manifestGeneration | If enabled, fluxd will look for .flux.yaml and run Kustomize or other manifest generators. | `bool` | `false` | no |
| flux\_prometheus\_enabled | Enable Prometheus metrics. | `bool` | `false` | no |
| flux\_spec\_chart | Flux spec chart options. | <pre>object({<br>    release_name  = string<br>    repository    = string<br>    chart_name    = string<br>    chart_version = string<br>  })</pre> | <pre>{<br>  "chart_name": "flux",<br>  "chart_version": "1.3.0",<br>  "release_name": "flux",<br>  "repository": "https://charts.fluxcd.io"<br>}</pre> | no |
| flux\_syncGarbage\_values | Flux syncGarbageCollection chart values. | <pre>object({<br>    syncGarbageCollection_enabled = bool<br>    syncGarbageCollection_dry     = bool<br>  })</pre> | <pre>{<br>  "syncGarbageCollection_dry": false,<br>  "syncGarbageCollection_enabled": false<br>}</pre> | no |
| flux\_sync\_values | Flux sync chart values. | <pre>object({<br>    sync_state    = string<br>    sync_timeout  = string<br>    sync_interval = string<br>  })</pre> | <pre>{<br>  "sync_interval": "5m",<br>  "sync_state": "git",<br>  "sync_timeout": "1m"<br>}</pre> | no |
| fluxcd\_namespace | Name for the fluxcd k8s namespace. | `string` | `"fluxcd"` | no |
| fluxcd\_secret\_name | Name for the fluxcd k8s secret. | `string` | `"fluxcd-secret"` | no |
| fluxcloud\_slack\_values | Fluxcloud Slack values. | <pre>object({<br>    username = string<br>    channel  = string<br>    emoji    = string<br>  })</pre> | <pre>{<br>  "channel": "#kubernetes",<br>  "emoji": ":hand:",<br>  "username": "fluxcloud"<br>}</pre> | no |
| fluxctl\_version | Fluxctl binary version. | `string` | `"1.19.0"` | no |
| helm\_operator\_crd\_url | HelmRelease Custom Resource Definition URL | `string` | `"https://raw.githubusercontent.com/fluxcd/helm-operator/1.1.0/deploy/crds.yaml"` | no |
| helm\_operator\_helm\_versions | Helm Operator helm.versions parameter. | `string` | `"v3"` | no |
| helm\_operator\_spec\_chart | Helm Operator spec chart options. | <pre>object({<br>    release_name  = string<br>    repository    = string<br>    chart_name    = string<br>    chart_version = string<br>  })</pre> | <pre>{<br>  "chart_name": "helm-operator",<br>  "chart_version": "1.0.2",<br>  "release_name": "helm-operator",<br>  "repository": "https://charts.fluxcd.io"<br>}</pre> | no |
| helm\_version | Helm binary version (>= v3.x). | `string` | `"3.1.2"` | no |
| helm\_whatup\_plugin\_url | Helm Whatup plugin URL (official). | `string` | `"https://github.com/bacongobbler/helm-whatup"` | no |
| install\_fluxctl | Whether to install fluxctl binary. | `bool` | `true` | no |
| install\_helm | Whether to install Helm binary. | `bool` | `true` | no |
| install\_helm\_whatup\_plugin | Whether to install Helm Whatup plugin. | `string` | `false` | no |
| manage\_github\_ssh\_pubkey | Whether to let the module manage Github SSH public key. | `bool` | `true` | no |
| slack\_api\_url | Slack API URL. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| git\_ssh\_pubkey | Generated SSH public key. |
