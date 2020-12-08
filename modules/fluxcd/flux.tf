# bootstrap flux without values
resource "helm_release" "flux" {
  count = var.bootstrap_flux && var.flux_values_file == "" ? 1 : 0

  name       = var.flux_spec_chart.release_name
  repository = var.flux_spec_chart.repository
  chart      = var.flux_spec_chart.chart_name
  version    = var.flux_spec_chart.chart_version

  namespace = kubernetes_namespace.fluxcd.id

  # flux git secret
  set {
    name  = "git.secretName"
    value = kubernetes_secret.fluxcd.metadata[0].name
  }
}

# bootstrap flux with values
resource "helm_release" "flux_w_values" {
  count = var.bootstrap_flux && var.flux_values_file != "" ? 1 : 0

  name       = var.flux_spec_chart.release_name
  repository = var.flux_spec_chart.repository
  chart      = var.flux_spec_chart.chart_name
  version    = var.flux_spec_chart.chart_version

  namespace = kubernetes_namespace.fluxcd.id

  # flux git secret
  set {
    name  = "git.secretName"
    value = kubernetes_secret.fluxcd.metadata[0].name
  }

  values = [
    file(var.flux_values_file)
  ]
}
