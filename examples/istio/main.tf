### locals ###

locals {
  kubectl_config_path = "~/.kube/config"
  kubectl_context     = "minikube"
}

### providers ###

# kubernetes provider
provider "kubernetes" {
  config_path    = local.kubectl_config_path
  config_context = local.kubectl_context
}

# Installs istio
module "istio" {
  source = "../../modules/istio"

  kubectl_context = local.kubectl_context

  istio_version = "1.5.2"
  profile       = "default"

  kiali_username   = "admin"
  kiali_passphrase = "password"

  values_file = "./istio-config.yaml"
}
