variable "vm_id" {
  description = "ID unique de la VM dans le cluster Proxmox"
  type        = number
}

variable "vm_name" {
  description = "Nom de la VM"
  type        = string
  default     = "debian12-template"
}

variable "node_name" {
  description = "Nom du noeud Proxmox"
  type        = string
}

variable "tags" {
  description = "Tags de la VM"
  type        = list(string)
  default     = ["terraform", "ubuntu-noble"]
}

variable "cpu_cores" {
  description = "Nombre de coeurs CPU"
  type        = number
  default     = 2
}

variable "cpu_type" {
  description = "Type de CPU"
  type        = string
  default     = "x86-64-v2-AES"
}

variable "memory" {
  description = "Mémoire en Mo"
  type        = number
  default     = 1024
}

variable "disk_size" {
  description = "Taille du disque en Go"
  type        = number
  default     = 10
}

variable "datastore_id" {
  description = "ID du datastore pour le disque"
  type        = string
}

variable "ipv4_address" {
  description = "Adresse IPv4 statique"
  type        = string
}

variable "gateway" {
  description = "Passerelle par défaut"
  type        = string
}

variable "dns_servers" {
  description = "Liste des serveurs DNS"
  type        = list(string)
  default     = ["172.16.20.254", "8.8.8.8"]
}

variable "username" {
  description = "Nom d'utilisateur pour la VM"
  type        = string
  default     = "cloud"
}

variable "ssh_public_key_path" {
  description = "Chemin du fichier contenant la clé publique SSH"
  type        = string
}

variable "network_bridge" {
  description = "Nom du pont réseau"
  type        = string
  default     = "vmbr1"
}

variable "network_vlan_id" {
  description = "Tag VLAN à appliquer à la carte réseau (optionnel)"
  type        = number
  default     = 20
}
