output "redis_endpoint" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}
