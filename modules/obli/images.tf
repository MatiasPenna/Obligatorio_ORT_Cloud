# Creamos un ECR donde almacenamos las imagenes
resource "aws_ecr_repository" "obl_ecr" {
  name                 = var.namerepoecrmodule
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}