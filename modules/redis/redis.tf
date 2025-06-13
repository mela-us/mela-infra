resource "azurerm_redis_cache" "redis_mela" {
  name                = "redis-mela-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  minimum_tls_version = 1.2
  redis_version       = "6"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}