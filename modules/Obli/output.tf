output "ecr_urlmodule" {
  value = aws_ecr_repository.obl_ecr.repository_url
}

output "cluster_namemodule" {
  value = aws_eks_cluster.eks_obl_01.name
}

 output "elasticache_urlmodule" {
   value = aws_elasticache_cluster.obl_ecache_cluster.cache_nodes.0.address
 }