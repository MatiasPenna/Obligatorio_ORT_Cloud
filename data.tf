data "aws_elasticache_cluster" "redis_cluster" {
  cluster_id   = var.clusteridec
  depends_on   = [module.obli.elasticache_cluster]
}