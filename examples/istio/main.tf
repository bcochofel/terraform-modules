### providers ###

# kubernetes provider
provider "kubernetes" {
  config_path    = var.kubectl_config_path
  config_context = var.kubectl_context
}

# Installs istio
module "istio" {
  source = "../../modules/istio"

  kubectl_context = var.kubectl_context

  istio_version = "1.5.2"
  profile       = "demo"

  kiali_username   = "admin"
  kiali_passphrase = "password"

#  values_file = "./istio-config.yaml"
}
