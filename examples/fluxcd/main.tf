# bootstraps flux and helm operator

### variables ###

variable "github_token" {}
variable "kubectl_context" {}

### main ###
module "fluxcd" {
  source = "../../modules/fluxcd"

  github_token    = var.github_token
  kubectl_context = var.kubectl_context

  manage_github_ssh_pubkey = true

  bootstrap_helm_operator = true
}
