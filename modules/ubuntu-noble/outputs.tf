output "vm_ip" {
  value       = proxmox_virtual_environment_vm.ubuntu_template.initialization[0].ip_config[0].ipv4[0].address
  description = "Adresse IP de la VM Debian"
}

output "ssh_public_key_path" {
  value = var.ssh_public_key_path
}
