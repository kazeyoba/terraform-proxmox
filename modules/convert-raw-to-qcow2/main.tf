variable "input_file" {
  description = "Chemin vers le fichier .raw d'entrée"
  type        = string
}

variable "output_file" {
  description = "Chemin vers le fichier .qcow2 de sortie"
  type        = string
}

resource "null_resource" "convert_raw_to_qcow2" {
  provisioner "local-exec" {
    command = "/usr/bin/qemu-img convert -f raw -O qcow2 ${var.input_file} ${var.output_file}"
  }

  triggers = {
    input  = var.input_file
    output = var.output_file
  }
}
