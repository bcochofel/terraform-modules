# add SSH public key to Github
resource "github_user_ssh_key" "ssh_key" {
  count = var.manage_github_ssh_pubkey ? 1 : 0

  title = "Terraform generated SSH key for automation"
  key   = tls_private_key.ssh_key.public_key_openssh
}
