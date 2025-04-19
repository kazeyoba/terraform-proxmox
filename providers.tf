terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.76.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token
  username  = var.username
  password  = var.password
  insecure  = true
  ssh {
    agent    = true
    username = "root"
  }
}
