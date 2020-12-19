# kubernetes provider
provider "kubernetes" {
  config_path    = var.kubectl_config_path
  config_context = var.kubectl_context
}

# Install istio-operator
module "istio-operator" {
  source = "../../modules/istio-operator"

  kubectl_context = var.kubectl_context

  istio_version = "1.8.0"
}
