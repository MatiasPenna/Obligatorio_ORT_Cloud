output "ecr_url" {
   value = module.obli.0.ecr_urlmodule
}

output "eks_cluster" {
  value = module.obli.0.cluster_namemodule
}

 output "ecache_url" {
   value = module.obli.elasticache_urlmodule
 }