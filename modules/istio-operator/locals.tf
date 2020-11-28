# local variables
locals {
  istio_url    = "https://istio.io/downloadIstio"
  istio_folder = "istio-${var.istio_version}"
  istio_bin    = "${var.bin_path}istioctl"

  sudo_str = var.sudo_string != "" ? "${var.sudo_string} " : ""
}
