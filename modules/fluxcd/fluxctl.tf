# install fluxctl binary
resource "null_resource" "fluxctl" {
  count = var.install_fluxctl ? 1 : 0

  triggers = {
    fluxctl_url      = local.fluxctl_url
    fluxctl_bin_path = local.fluxctl_bin
    sudo_str         = local.sudo_str
  }

  # install fluxctl binary
  provisioner "local-exec" {
    command = <<EOT
      wget -q ${self.triggers.fluxctl_url}
      ${self.triggers.sudo_str}cp ${local.fluxctl_downloaded_file} ${self.triggers.fluxctl_bin_path}
      ${self.triggers.sudo_str}chmod a+x ${self.triggers.fluxctl_bin_path}
      rm -f ${local.fluxctl_downloaded_file}
    EOT
  }

  # uninstall fluxctl binary
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue

    command = <<EOT
      ${self.triggers.sudo_str}rm -f ${self.triggers.fluxctl_bin_path}
    EOT
  }
}
