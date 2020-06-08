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
