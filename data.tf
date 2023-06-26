data "aws_ecr_repository" "obl_ecr" {
  name = var.namerepoecr
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.nameclustereks
}

data "aws_elasticache_cluster" "ecache_cluster" {
  cluster_id = var.clusteridec
}