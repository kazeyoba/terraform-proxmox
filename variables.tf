variable "endpoint" {
  description = "URL vers Proxmox"
  type = string
}

variable "username" {
  description = "Login compte technique"
  type = string
}

variable "password" {
  description = "Password compte technique"
  type = string
}

variable "api_token" {
  description = "Token to connect Proxmox API"
  type = string
}