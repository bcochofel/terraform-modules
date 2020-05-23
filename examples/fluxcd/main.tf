### providers ###

# github provider
provider "github" {
  token      = var.github_token
  individual = true
}

# kubernetes provider
provider "kubernetes" {
  config_path    = var.kubectl_config_path
  config_context = var.kubectl_context
}

# helm provider
provider "helm" {
  kubernetes {
    config_path    = var.kubectl_config_path
    config_context = var.kubectl_context
  }
}

### locals ###

locals {
  namespace = "fluxcd"
}

### modules ###

# bootstraps flux and helm operator
module "fluxcd" {
  source = "../../modules/fluxcd"

  # github ssh key
  manage_github_ssh_pubkey = true

  # kubernetes objects
  fluxcd_namespace   = local.namespace
  fluxcd_secret_name = "fluxcd-secret"

  # helm binary and whatup plugin
  install_helm               = true
  helm_version               = "3.1.2"
  install_helm_whatup_plugin = true
  # official helm whatup doesn't support helm v3 yet...
  helm_whatup_plugin_url = "https://github.com/fabmation-gmbh/helm-whatup"

  # helm operator
  bootstrap_helm_operator     = true
  helm_operator_helm_versions = "v3"

  # fluxctl binary
  install_fluxctl = true
  fluxctl_version = "1.19.0"

  # flux and fluxcloud
  bootstrap_flux      = true
  bootstrap_fluxcloud = false
  flux_git_values = {
    git_url          = "git@github.com:bcochofel/k8s-gitops-manifests.git"
    git_readonly     = false
    git_branch       = "master"
    git_path         = "manifests"
    git_user         = "Weave Flux"
    git_email        = "support@weave.works"
    git_pollInterval = "1m"
    git_timeout      = "20s"
  }
}
