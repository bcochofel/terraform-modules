# apply helm operator crd
resource "null_resource" "helm_operator_crd" {
  count = var.bootstrap_helm_operator ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -f ${var.helm_operator_crd_url}
    EOT
  }
}

# delete helm operator crd
resource "null_resource" "helm_operator_crd_destroy" {
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue

    command = <<EOT
      kubectl delete -f ${var.helm_operator_crd_url}
    EOT
  }
}

# bootstrap helm operator
resource "helm_release" "helm_operator" {
  depends_on = [null_resource.helm_operator_crd]

  name       = var.helm_operator_spec_chart.release_name
  repository = var.helm_operator_spec_chart.repository
  chart      = var.helm_operator_spec_chart.chart_name
  version    = var.helm_operator_spec_chart.chart_version

  namespace = kubernetes_namespace.fluxcd.id

  set {
    name  = "git.secretName"
    value = kubernetes_secret.fluxcd.metadata[0].name
  }

  set {
    name  = "helm.versions"
    value = var.helm_operator_helm_versions
  }
}
