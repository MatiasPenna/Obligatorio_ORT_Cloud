resource "aws_elasticache_subnet_group" "obl_ecache_subnets" {
  name        = var.nameecmodule
  description = var.descecmodule
  subnet_ids  = [aws_subnet.subnet_obl_01.id, aws_subnet.subnet_obl_02.id]
}

resource "aws_elasticache_parameter_group" "obl_ecache_grp" {
  name   = var.namegrecmodule
  family = var.familygrecmodule

  parameter {
    name  = "maxmemory-policy" 
    value = "allkeys-lru"
  }
}

resource "aws_elasticache_cluster" "obl_ecache_cluster" {
  cluster_id           = var.clusteridecmodule
  engine               = var.engineclusterecmodule
  engine_version       = var.engineverecmodule
  node_type            = var.nodetypeecmodule
  num_cache_nodes      = var.nodecachenodesecmodule
  parameter_group_name = aws_elasticache_parameter_group.obl_ecache_grp.name
  subnet_group_name    = aws_elasticache_subnet_group.obl_ecache_subnets.name
  security_group_ids   = [aws_security_group.sg_obl.id] 
}