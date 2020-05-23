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
