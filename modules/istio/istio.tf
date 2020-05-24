resource "null_resource" "istio" {
  depends_on = [
    kubernetes_secret.kiali
  ]

  triggers = {
    istioctl        = local.istio_bin
    profile         = var.profile
    custom_values   = local.custom_values
    values_md5      = local.values_file_md5
    sudo_str        = local.sudo_str
    kubectl_context = var.kubectl_context
  }

  provisioner "local-exec" {
    command = <<EOT
      # kubectl context
      kubectl config set-context ${self.triggers.kubectl_context}

      # download istio
      curl -sL ${local.istio_url} | ISTIO_VERSION=${var.istio_version} sh -
      ${self.triggers.sudo_str}cp ${local.istio_folder}/bin/istioctl ${self.triggers.istioctl}
      ${self.triggers.sudo_str}chmod a+x ${self.triggers.istioctl}

      # install istio
      ${self.triggers.istioctl} manifest apply ${self.triggers.custom_values} \
        --set profile=${self.triggers.profile}
    EOT
  }

  provisioner "local-exec" {
    when       = destroy
    on_failure = continue
    command    = <<EOT
      # kubectl context
      kubectl config set-context ${self.triggers.kubectl_context}

      ${self.triggers.istioctl} manifest generate ${self.triggers.custom_values} \
        --set profile=${self.triggers.profile} | kubectl delete -f -
      ${self.triggers.sudo_str}rm -f ${self.triggers.istioctl}
    EOT
  }
}
