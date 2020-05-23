# bootstrap flux with fluxcloud
resource "helm_release" "flux_w_fluxcloud" {
  count = var.bootstrap_flux && var.bootstrap_fluxcloud ? 1 : 0

  name       = var.flux_spec_chart.release_name
  repository = var.flux_spec_chart.repository
  chart      = var.flux_spec_chart.chart_name
  version    = var.flux_spec_chart.chart_version

  namespace = kubernetes_namespace.fluxcd.id

  values = [
    "${templatefile("${path.module}/templates/values.tmpl", {
      slack_url      = var.slack_api_url,
      slack_username = var.fluxcloud_slack_values.username,
      slack_channel  = var.fluxcloud_slack_values.channel,
      slack_emoji    = var.fluxcloud_slack_values.emoji,
      github_url     = var.flux_git_values.git_url
    })}"
  ]

  # flux git secret
  set {
    name  = "git.secretName"
    value = kubernetes_secret.fluxcd.metadata[0].name
  }

  # flux manifest generation
  set {
    name  = "manifestGeneration"
    value = var.flux_manifestGeneration
  }

  # flux prometheus
  set {
    name  = "prometheus.enabled"
    value = var.flux_prometheus_enabled
  }

  # flux sync values
  dynamic "set" {
    for_each = var.flux_sync_values

    content {
      name  = replace(set.key, "_", ".")
      value = set.value
    }
  }

  # flux git values
  dynamic "set" {
    for_each = var.flux_git_values

    content {
      name  = replace(set.key, "_", ".")
      value = set.value
    }
  }

  # flux syncGarbageCollection values
  dynamic "set" {
    for_each = var.flux_syncGarbage_values

    content {
      name  = replace(set.key, "_", ".")
      value = set.value
    }
  }
}

# bootstrap flux without fluxcloud
resource "helm_release" "flux" {
  count = var.bootstrap_flux && ! var.bootstrap_fluxcloud ? 1 : 0

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

  # flux manifest generation
  set {
    name  = "manifestGeneration"
    value = var.flux_manifestGeneration
  }

  # flux prometheus
  set {
    name  = "prometheus.enabled"
    value = var.flux_prometheus_enabled
  }

  # flux sync values
  dynamic "set" {
    for_each = var.flux_sync_values

    content {
      name  = replace(set.key, "_", ".")
      value = set.value
    }
  }

  # flux git values
  dynamic "set" {
    for_each = var.flux_git_values

    content {
      name  = replace(set.key, "_", ".")
      value = set.value
    }
  }

  # flux syncGarbageCollection values
  dynamic "set" {
    for_each = var.flux_syncGarbage_values

    content {
      name  = replace(set.key, "_", ".")
      value = set.value
    }
  }
}
