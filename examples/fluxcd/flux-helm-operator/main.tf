### providers ###

# github provider
provider "github" {
  token = var.github_token
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

### modules ###

# bootstraps flux and helm operator
module "fluxcd" {
  source = "../../../modules/fluxcd"

  # generic
  bin_path    = "~/bin/"
  sudo_string = ""

  # github ssh key
  manage_github_ssh_pubkey = true

  # kubernetes objects
  fluxcd_namespace   = "fluxcd"
  fluxcd_secret_name = "fluxcd-secret"

  # helm binary and whatup plugin
  install_helm               = true
  helm_version               = "3.4.1"
  install_helm_whatup_plugin = true
  # official helm whatup doesn't support helm v3 yet...
  helm_whatup_plugin_url = "https://github.com/fabmation-gmbh/helm-whatup"

  # helm operator
  bootstrap_helm_operator   = true
  helm_operator_values_file = "helm_operator_values.yaml"

  # fluxctl binary
  install_fluxctl = true
  fluxctl_version = "1.21.0"

  # flux and fluxcloud
  bootstrap_flux   = true
  flux_values_file = "flux_values.yaml"
}
