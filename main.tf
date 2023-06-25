# Definir proveedor de infraestructura (AWS)
provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "local_script" {
  depends_on = [aws_eks_node_group.worker_node_obl_01]

  provisioner "local-exec" {
    command = "sh build.sh"
  }
}