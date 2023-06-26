data "aws_ecr_repository" "obl_ecr" {
  name = var.namerepoecr
  depends_on = [module.Obli.aws_ecr_repository.obl_ecr]
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.nameclustereks
  depends_on = [module.obli.aws_eks_cluster.eks_obl_01]
}

data "aws_elasticache_cluster" "ecache_cluster" {
  cluster_id = var.clusteridec
  depends_on = [module.obli.aws_elasticache_cluster.obl_ecache_cluster]
}