variable "duration" {
  description = "Durée de la pause en secondes"
  type        = number
}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep ${var.duration}"
  }
}
