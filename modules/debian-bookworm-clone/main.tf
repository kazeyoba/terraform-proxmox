data "proxmox_virtual_environment_vms" "template" {
  node_name = "pve"
  tags      = ["template", "debian12"]
}

resource "proxmox_virtual_environment_vm" "debian_template" {

  description = "Managed by Terraform"
  vm_id       = var.vm_id
  name        = var.vm_name
  node_name   = var.node_name
  tags        = var.tags

  on_boot  = false
  template = false
  started  = true

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  agent {
    enabled = true
    timeout = "2m"
  }

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  memory {
    dedicated = var.memory
    floating  = var.memory
  }

  disk {
    interface   = "scsi0"
    iothread    = true
    discard     = "ignore"
    size        = var.disk_size
    file_format = "qcow2"
  }

  clone {
    vm_id = data.proxmox_virtual_environment_vms.template.vms[0].vm_id
  }

  initialization {
    datastore_id = var.datastore_id
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.gateway
      }
    }

    dns {
      servers = var.dns_servers
    }

    user_account {
      username = var.username
      keys     = [file(var.ssh_public_key_path)]
    }
  }

  network_device {
    bridge   = var.network_bridge
    model    = "virtio"
    firewall = false
    enabled  = true
    vlan_id  = var.network_vlan_id
  }

  operating_system {
    type = "l26"
  }

  tpm_state {
    datastore_id = var.datastore_id
    version      = "v2.0"
  }

  serial_device {
    device = "socket"
  }
}
