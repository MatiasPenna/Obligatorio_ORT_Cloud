output "ecr_url" {
  value = data.aws_ecr_repository.obl_ecr.repository_url
}

output "eks_cluster" {
  value = data.aws_eks_cluster.eks_cluster.name
}

output "ecache_url" {
  value = data.aws_elasticache_cluster.ecache_cluster.cache_nodes[0].address
}