data "aws_ecr_repository" "obl_ecr" {
  name = var.namerepoecr
  depends_on = [module.obli]
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.nameclustereks
  depends_on = [module.obli]
}

data "aws_elasticache_cluster" "ecache_cluster" {
  cluster_id = var.clusteridec
  depends_on = [module.obli]
}