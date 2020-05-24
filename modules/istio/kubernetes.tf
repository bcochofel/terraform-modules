# create k8s namespace for istio
resource "kubernetes_namespace" "istio" {
  metadata {
    name = "istio-system"
  }
}

# create kubernetes secret for kiali UI
resource "kubernetes_secret" "kiali" {
  metadata {
    name      = "kiali"
    namespace = kubernetes_namespace.istio.id
  }

  type = "Opaque"

  data = {
    username   = var.kiali_username
    passphrase = var.kiali_passphrase
  }
}
