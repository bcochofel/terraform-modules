# install fluxctl binary
resource "null_resource" "fluxctl" {
  count = var.install_fluxctl ? 1 : 0

  triggers = {
    fluxctl_url      = "https://github.com/fluxcd/flux/releases/download/${var.fluxctl_version}/fluxctl_linux_amd64"
    fluxctl_bin_path = "/usr/local/bin/fluxctl"
  }

  # install fluxctl binary
  provisioner "local-exec" {
    command = <<EOT
      wget -q ${self.triggers.fluxctl_url}
      sudo cp fluxctl_linux_amd64 ${self.triggers.fluxctl_bin_path}
      sudo chmod a+x ${self.triggers.fluxctl_bin_path}
      rm -f fluxctl_linux_amd64
    EOT
  }

  # uninstall fluxctl binary
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue

    command = <<EOT
      sudo rm -f ${self.triggers.fluxctl_bin_path}
    EOT
  }
}
