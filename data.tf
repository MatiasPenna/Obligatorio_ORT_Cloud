data "aws_elasticache_cluster" "redis_cluster" {
  cluster_id = var.clusteridec
}