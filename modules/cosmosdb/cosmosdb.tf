resource "azurerm_mongo_cluster" "cosmos_mongodb_mela" {
  name = "cosmos-mongodb-mela-${var.env}"

  resource_group_name = var.resource_group_name
  location            = var.cosmosdb_location

  administrator_username = var.administrator_username
  administrator_password = var.cosmosdb_administrator_password
  shard_count            = var.shard_count
  compute_tier           = var.compute_tier
  storage_size_in_gb     = var.storage_size_in_gb
  high_availability_mode = "Disabled"
  version                = "7.0"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}
