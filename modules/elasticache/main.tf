resource "aws_elasticache_replication_group" "this" {
  automatic_failover_enabled  = true
  preferred_cache_cluster_azs = var.subnet_ids
  replication_group_id        = var.name
  description                 = "Dev elasticache"
  node_type                   = var.node_type
  num_cache_clusters          = 2
  parameter_group_name        = "default.redis7.cluster.on"
  port                        = 6379
}
