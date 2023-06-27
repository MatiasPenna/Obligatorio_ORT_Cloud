output "ecr_url" {
   value = module.obli.0.ecr_urlmodule
}

output "eks_cluster" {
  value = module.obli.0.cluster_namemodule
}

 output "ecache_url" {
   value = module.obli.elasticache_urlmodule
 }

# output "ecache_url" {
#   #value = data.aws_elasticache_cluster.ecache_cluster.cache_nodes[0].address
#   value = data.aws_elasticache_cluster.ecache_cluster.configuration_endpoint_address
# }