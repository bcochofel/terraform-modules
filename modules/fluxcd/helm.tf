# install helm binary
resource "null_resource" "helm" {
  count = var.install_helm ? 1 : 0

  triggers = {
    helm_url      = local.helm_url
    helm_bin_path = local.helm_bin
    sudo_str      = local.sudo_str
  }

  # install helm binary
  provisioner "local-exec" {
    command = <<EOT
      curl -sO ${self.triggers.helm_url}
      tar xzvf ${local.helm_downloaded_file}
      ${self.triggers.sudo_str}cp linux-amd64/helm ${self.triggers.helm_bin_path}
      ${self.triggers.sudo_str}chmod a+x ${self.triggers.helm_bin_path}
      rm -rf linux-amd64/ ${local.helm_downloaded_file}
    EOT
  }

  # uninstall helm binary
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue

    command = <<EOT
      ${self.triggers.sudo_str}rm -f ${self.triggers.helm_bin_path}
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
