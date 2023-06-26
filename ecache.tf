resource "aws_elasticache_subnet_group" "obl_ecache_subnets" {
  name        = "oblecachesubn"
  description = "obl_ecache"
  subnet_ids  = [aws_subnet.subnet_obl_01.id, aws_subnet.subnet_obl_02.id]
}

resource "aws_elasticache_parameter_group" "obl_ecache_grp" {
  name   = "oblecachegrp"
  family = "redis6.x"

  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }
}

resource "aws_elasticache_cluster" "obl_ecache_cluster" {
  cluster_id           = "oblecache"
  engine               = "redis"
  engine_version       = "6.2"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.obl_ecache_grp.name
  subnet_group_name    = aws_elasticache_subnet_group.obl_ecache_subnets.name
  security_group_ids   = [aws_security_group.sg_obl.id] 

}