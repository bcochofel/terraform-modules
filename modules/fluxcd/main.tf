# create SSH key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

# create fluxcd namespace
resource "kubernetes_namespace" "fluxcd" {
  metadata {
    name = var.fluxcd_namespace
  }
}

# create fluxcd secret
resource "kubernetes_secret" "fluxcd" {
  metadata {
    name      = var.fluxcd_secret_name
    namespace = kubernetes_namespace.fluxcd.id
  }

  type = "Opaque"

  data = {
    identity = tls_private_key.ssh_key.private_key_pem
  }
}
