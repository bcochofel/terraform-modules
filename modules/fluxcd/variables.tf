variable "github_token" {
  description = "GitHub personal access token"
  type        = string
}

variable "kubectl_config_path" {
  description = "Path to the kube config file."
  type        = string
  default     = "~/.kube/config"
}

variable "kubectl_context" {
  description = "Kube context to choose from the config file."
  type        = string
}

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
