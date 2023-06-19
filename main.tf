# Definir proveedor de infraestructura (AWS)
provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "cmd /C script.bat"
  }
}