output "ecr_url" {
   value = module.obli.ecr_urlmodule
}

output "eks_cluster" {
  value = module.obli.cluster_namemodule
}

output "ecache_url" {
  value = module.obli.elasticache_urlmodule
}