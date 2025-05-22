output "redis_hostname" {
  description = "The hostname of the Azure Redis Cache instance"
  value       = azurerm_redis_cache.redis.hostname
}
output "redis_primary_key" {
  description = "The primary access key for the Azure Redis Cache instance"
  value       = azurerm_redis_cache.redis.primary_access_key
  sensitive   = true
}
