# Definir proveedor de infraestructura (AWS)
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "local_script" {
  depends_on = [aws_ecr_repository.obl_ecr]

  provisioner "local-exec" {
    command = "sh build.sh"
  }
}