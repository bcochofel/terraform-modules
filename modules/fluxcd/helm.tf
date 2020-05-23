# install helm binary
resource "null_resource" "helm" {
  count = var.install_helm ? 1 : 0

  triggers = {
    helm_url      = "https://get.helm.sh/helm-v${var.helm_version}-linux-amd64.tar.gz"
    helm_bin_path = "/usr/local/bin/helm"
  }

  # install helm binary
  provisioner "local-exec" {
    command = <<EOT
      curl -sO ${self.triggers.helm_url}
      tar xzvf helm-v${var.helm_version}-linux-amd64.tar.gz
      sudo cp linux-amd64/helm ${self.triggers.helm_bin_path}
      sudo chmod a+x ${self.triggers.helm_bin_path}
      rm -rf linux-amd64 helm-v${var.helm_version}-linux-amd64.tar.gz
    EOT
  }

  # uninstall helm binary
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue

    command = <<EOT
      sudo rm -f ${self.triggers.helm_bin_path}
    EOT
  }
}

# install helm whatup plugin
resource "null_resource" "helm_whatup" {
  count = var.install_helm_whatup_plugin ? 1 : 0

  depends_on = [
    null_resource.helm[0]
  ]

  triggers = {
    helm_plugin_url = var.helm_whatup_plugin_url
  }

  # install plugin
  provisioner "local-exec" {
    command = <<EOT
      helm plugin install ${var.helm_whatup_plugin_url}
    EOT
  }

  # uninstall plugin
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue

    command = <<EOT
      helm plugin uninstall whatup
    EOT
  }
}
