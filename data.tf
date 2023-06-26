data "aws_elasticache_cluster" "ecache_cluster" {
  cluster_id = var.clusteridec
}

output "ecache_url" {
  value = data.aws_elasticache_cluster.ecache_cluster.cache_nodes[0].address
}