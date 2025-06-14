output "hostname" {
  description = "The hostname of the Redis server."
  value       = azurerm_redis_cache.redis_mela.hostname
}

output "port" {
  description = "The port on which the Redis server is running."
  value       = azurerm_redis_cache.redis_mela.ssl_port
}

output "primary_access_key" {
  description = "The primary access key for the Redis instance."
  value       = azurerm_redis_cache.redis_mela.primary_access_key
  sensitive   = true
}
