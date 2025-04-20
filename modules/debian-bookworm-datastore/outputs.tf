output "vm_ip" {
  value       = proxmox_virtual_environment_vm.debian_template.initialization[0].ip_config[0].ipv4[0].address
  description = "Adresse IP de la VM Debian"
}

output "ssh_public_key_path" {
  value = var.ssh_public_key_path
}

output "vm_name" {
  description = "Nom de la VM créée"
  value       = proxmox_virtual_environment_vm.debian_template.name
}

output "vm_id" {
  description = "ID de la VM créée"
  value       = proxmox_virtual_environment_vm.debian_template.vm_id
}

output "node_name" {
  description = "Nom du noeud Proxmox où la VM a été créée"
  value       = proxmox_virtual_environment_vm.debian_template.node_name
}