output "primary_connection_string" {
  value       = azurerm_redis_cache.redis_mela.primary_connection_string
  description = "The connection string for the Redis instance."
  sensitive   = true
}
