# local variables
locals {
  helm_downloaded_file    = "helm-v${var.helm_version}-linux-amd64.tar.gz"
  helm_url                = "https://get.helm.sh/${local.helm_downloaded_file}"
  helm_bin                = "${var.bin_path}helm"
  fluxctl_downloaded_file = "fluxctl_linux_amd64"
  fluxctl_url             = "https://github.com/fluxcd/flux/releases/download/${var.fluxctl_version}/${local.fluxctl_downloaded_file}"
  fluxctl_bin             = "${var.bin_path}fluxctl"

  sudo_str = var.sudo_string != "" ? "${var.sudo_string} " : ""
}
