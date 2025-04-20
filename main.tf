locals {
  create_vms = {
    master-00 = { vm_id = 501, ip = "172.16.20.30/24" }
    master-01 = { vm_id = 502, ip = "172.16.20.31/24" }
    master-02 = { vm_id = 503, ip = "172.16.20.32/24" }
    worker-00 = { vm_id = 504, ip = "172.16.20.33/24" }
    worker-01 = { vm_id = 505, ip = "172.16.20.34/24" }
    worker-02 = { vm_id = 506, ip = "172.16.20.35/24" }
  }
}

module "debian_vm" {
  for_each = local.create_vms

  source              = "./modules/debian-bookworm-datastore"
  vm_id               = each.value.vm_id
  vm_name             = each.key
  node_name           = "pve"
  datastore_id        = "DATASTORE"
  disk_size           = 30
  memory              = 8192
  cpu_cores           = 4
  ipv4_address        = each.value.ip
  gateway             = "172.16.20.254"
  ssh_public_key_path = "public_keys/bastion.pub"
}
