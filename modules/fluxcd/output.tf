output "git-ssh-public-key" {
  description = "Generated SSH public key."
  value       = tls_private_key.ssh_key.public_key_openssh
}
