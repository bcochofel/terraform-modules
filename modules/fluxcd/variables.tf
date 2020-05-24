### generic

variable "bin_path" {
  description = "Directory to copy binary files (should be in your PATH and end with '/')."
  type        = string
  default     = "~/bin/"
}

variable "sudo_string" {
  description = "Use sudo to copy/delete files, eg: 'sudo' (should be passwordless)."
  type        = string
  default     = ""
}

### github

variable "manage_github_ssh_pubkey" {
  description = "Whether to let the module manage Github SSH public key."
  type        = bool
  default     = true
}

### kubernetes

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

### helm operator

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

variable "helm_operator_values_file" {
  description = "Helm Operator values files."
  type        = string
  default     = ""
}

### helm

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

### helm whatup plugin

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

### fluxctl

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

### flux/fluxcloud

variable "bootstrap_flux" {
  description = "Whether to bootstrap flux on k8s."
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

variable "flux_values_file" {
  description = "Flux values files."
  type        = string
  default     = ""
}
