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

variable "kubectl_context" {
  description = "kubectl config context to apply Istio (kubectl should be in your PATH)."
  type        = string
}

### istio

variable "istio_version" {
  description = "Istio version."
  type        = string
  default     = "1.8.0"
}
