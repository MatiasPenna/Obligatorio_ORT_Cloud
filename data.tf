data "aws_ecr_repository" "obl_ecr" {
  name = var.clusteridec
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.clusteridec
}

data "aws_elasticache_cluster" "ecache_cluster" {
  cluster_id = var.clusteridec
}