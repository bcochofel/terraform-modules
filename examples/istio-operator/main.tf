# Install istio-operator
module "istio-operator" {
  source = "../../modules/istio-operator"

  kubectl_context = var.kubectl_context

  istio_version = "1.8.0"
}
