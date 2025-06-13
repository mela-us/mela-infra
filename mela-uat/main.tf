resource "azurerm_resource_group" "rg_mela_uat" {
  name     = "rg-mela-uat"
  location = "Southeast Asia"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

module "mongodb" {
  source = "../modules/cosmosdb"
  env    = var.env

  resource_group_name = azurerm_resource_group.rg_mela_uat.name
  cosmosdb_location   = "Southeast Asia"

  administrator_username          = "mela"
  cosmosdb_administrator_password = var.cosmosdb_administrator_password
  shard_count                     = "1"
  compute_tier                    = "Free"
  storage_size_in_gb              = "32"

  common_tags = var.common_tags
}


module "webapp" {
  source = "../modules/webapp"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_uat.name
  resource_group_location = azurerm_resource_group.rg_mela_uat.location
  os_type                 = "Linux"
  sku_name                = "B1"

  docker_image_name              = var.docker_image_name
  docker_registry_username       = var.docker_registry_username
  docker_registry_password       = var.docker_registry_password
  azure_openai_endpoint          = module.openai.endpoint
  azure_openai_api_key           = module.openai.primary_access_key
  azure_storage_account_name     = module.storage_account.storage_account_name
  azure_storage_account_key      = module.storage_account.storage_account_primary_access_key
  jwt_forget_password_secret_key = var.jwt_forget_password_secret_key
  jwt_secret_key                 = var.jwt_secret_key
  mail_username                  = var.mail_username
  mail_password                  = var.mail_password
  mongodb_db_connection_string   = module.mongodb.connection_string
  redis_connection_string        = module.redis.primary_connection_string
  storage_provider               = "azure"

  common_tags = var.common_tags
}

module "redis" {
  source = "../modules/redis"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_uat.name
  resource_group_location = azurerm_resource_group.rg_mela_uat.location

  capacity = 0
  family   = "C"
  sku_name = "Basic"

  common_tags = var.common_tags
}

module "storage_account" {
  source = "../modules/storage-account"
  env    = var.env

  resource_group_name      = azurerm_resource_group.rg_mela_uat.name
  resource_group_location  = azurerm_resource_group.rg_mela_uat.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  common_tags = var.common_tags
}

module "openai" {
  source = "../modules/ai-service"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_uat.name
  openai_service_location = "Japan East"
  common_tags             = var.common_tags
}
