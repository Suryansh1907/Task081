resource "azurerm_redis_cache" "redis" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  enable_non_ssl_port = false
  tags                = var.tags
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_redis_cache.redis.hostname
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_primary_key" {
  name         = var.redis_primary_key_secret_name
  value        = azurerm_redis_cache.redis.primary_access_key
  key_vault_id = var.keyvault_id
}
