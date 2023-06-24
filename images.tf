# Creamos un ECR donde almacenamos las imagenes
resource "aws_ecr_repository" "obl_ecr" {
  name                 = "obl_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

## Build de las imagenes y push
resource "docker_registry_image" "obl" {
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.obl_ecr.repository_url}:${each.key}"

    build {
        context = "../src/${each.key}"
        dockerfile = "Dockerfile"
    }  
}

# Build de la imagen de redis que se encuentra en otro directorio el dockerfile
resource "docker_registry_image" "obl_cartservice" {
    name = "${aws_ecr_repository.obl_ecr.repository_url}:cartservice"

    build {
        context = "../src/cartservice/src"
        dockerfile = "Dockerfile"
    }  
}