output "vm_name" {
  value = module.bastion.vm_name
}

output "public_ip" {
  value = module.bastion.public_ip
}

output "ssh_priv_key" {
  value = tls_private_key.example_ssh.private_key_pem
}
