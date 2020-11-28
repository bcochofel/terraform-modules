resource "null_resource" "istio" {

  triggers = {
    istioctl        = local.istio_bin
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

      # install istio-operator
      ${self.triggers.istioctl} operator init
    EOT
  }

  provisioner "local-exec" {
    when       = destroy
    on_failure = continue
    command    = <<EOT
      # kubectl context
      kubectl config set-context ${self.triggers.kubectl_context}

      # remove istio-operator
      kubectl delete ns istio-operator --grace-period=0 --force
    EOT
  }
}
