variable "manage_github_ssh_pubkey" {
  description = "Whether to let the module manage Github SSH public key."
  type        = bool
  default     = true
}

variable "fluxcd_namespace" {
  description = "Name for the fluxcd k8s namespace."
  type        = string
  default     = "fluxcd"
}

variable "fluxcd_secret_name" {
  description = "Name for the fluxcd k8s secret."
  type        = string
  default     = "fluxcd-secret"
}

variable "bootstrap_helm_operator" {
  description = "Whether to bootstrap Helm Operator on k8s."
  type        = bool
  default     = true
}

variable "helm_operator_crd_url" {
  description = "HelmRelease Custom Resource Definition URL"
  type        = string
  default     = "https://raw.githubusercontent.com/fluxcd/helm-operator/1.1.0/deploy/crds.yaml"
}

variable "helm_operator_spec_chart" {
  description = "Helm Operator spec chart options."
  type = object({
    release_name  = string
    repository    = string
    chart_name    = string
    chart_version = string
  })
  default = {
    release_name  = "helm-operator"
    repository    = "https://charts.fluxcd.io"
    chart_name    = "helm-operator"
    chart_version = "1.0.2"
  }
}

variable "helm_operator_helm_versions" {
  description = "Helm Operator helm.versions parameter."
  type        = string
  default     = "v3"
}

variable "install_helm" {
  description = "Whether to install Helm binary."
  type        = bool
  default     = true
}

variable "helm_version" {
  description = "Helm binary version (>= v3.x)."
  type        = string
  default     = "3.1.2"
}

variable "install_helm_whatup_plugin" {
  description = "Whether to install Helm Whatup plugin."
  type        = string
  default     = false
}

variable "helm_whatup_plugin_url" {
  description = "Helm Whatup plugin URL (official)."
  type        = string
  default     = "https://github.com/bacongobbler/helm-whatup"
}

variable "install_fluxctl" {
  description = "Whether to install fluxctl binary."
  type        = bool
  default     = true
}

variable "fluxctl_version" {
  description = "Fluxctl binary version."
  type        = string
  default     = "1.19.0"
}

variable "bootstrap_flux" {
  description = "Whether to bootstrap flux on k8s."
  type        = bool
  default     = true
}

variable "bootstrap_fluxcloud" {
  description = "Whether to bootstrap fluxcloud sidecar."
  type        = bool
  default     = true
}

variable "flux_spec_chart" {
  description = "Flux spec chart options."
  type = object({
    release_name  = string
    repository    = string
    chart_name    = string
    chart_version = string
  })
  default = {
    release_name  = "flux"
    repository    = "https://charts.fluxcd.io"
    chart_name    = "flux"
    chart_version = "1.3.0"
  }
}

variable "flux_sync_values" {
  description = "Flux sync chart values."
  type = object({
    sync_state    = string
    sync_timeout  = string
    sync_interval = string
  })
  default = {
    sync_state    = "git"
    sync_timeout  = "1m"
    sync_interval = "5m"
  }
}

variable "flux_git_values" {
  description = "Flux git chart values."
  type = object({
    git_url          = string
    git_readonly     = bool
    git_branch       = string
    git_path         = string
    git_user         = string
    git_email        = string
    git_pollInterval = string
    git_timeout      = string
  })
  default = {
    git_url          = ""
    git_readonly     = false
    git_branch       = "master"
    git_path         = ""
    git_user         = "Weave Flux"
    git_email        = "support@weave.works"
    git_pollInterval = "5m"
    git_timeout      = "20s"
  }
}

variable "flux_syncGarbage_values" {
  description = "Flux syncGarbageCollection chart values."
  type = object({
    syncGarbageCollection_enabled = bool
    syncGarbageCollection_dry     = bool
  })
  default = {
    syncGarbageCollection_enabled = false
    syncGarbageCollection_dry     = false
  }
}

variable "flux_prometheus_enabled" {
  description = "Enable Prometheus metrics."
  type        = bool
  default     = false
}
variable "flux_manifestGeneration" {
  description = "If enabled, fluxd will look for .flux.yaml and run Kustomize or other manifest generators."
  type        = bool
  default     = false
}

variable "slack_api_url" {
  description = "Slack API URL."
  type        = string
  default     = ""
}

variable "fluxcloud_slack_values" {
  description = "Fluxcloud Slack values."
  type = object({
    username = string
    channel  = string
    emoji    = string
  })
  default = {
    username = "fluxcloud"
    channel  = "#kubernetes"
    emoji    = ":hand:"
  }
}
