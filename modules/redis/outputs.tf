output "hostname" {
  description = "The hostname of the Redis server."
  value       = azurerm_redis_cache.redis_mela.hostname
}

output "port" {
  description = "The port on which the Redis server is running."
  value       = azurerm_redis_cache.redis_mela.port
}

output "primary_connection_string" {
  description = "The primary connection string for the Redis instance."
  value       = azurerm_redis_cache.redis_mela.primary_connection_string
  sensitive   = true
}