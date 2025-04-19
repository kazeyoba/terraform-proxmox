locals {
  debian_vms = {
    debian-vm-01 = { vm_id = 501, ip = "172.16.20.40/24" }
    debian-vm-02 = { vm_id = 502, ip = "172.16.20.41/24" }
    debian-vm-03 = { vm_id = 503, ip = "172.16.20.42/24" }
    debian-vm-04 = { vm_id = 504, ip = "172.16.20.43/24" }
    debian-vm-05 = { vm_id = 505, ip = "172.16.20.44/24" }
    debian-vm-06 = { vm_id = 506, ip = "172.16.20.45/24" }
  }
}

module "debian_vm" {
  for_each            = local.debian_vms

  source              = "./modules/debian-bookworm-datastore"
  vm_id               = each.value.vm_id
  vm_name             = each.key
  node_name           = "pve"
  datastore_id        = "DATASTORE"
  disk_size           = 20
  ipv4_address        = each.value.ip
  gateway             = "172.16.20.254"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
}
