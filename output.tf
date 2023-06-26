output "ecr_url" {
   value = module.obli.ecr_url
}

output "eks_cluster" {
  value = module.obli.cluster_name
}

output "ecache_url" {
  value = module.obli.elasticache_url
}