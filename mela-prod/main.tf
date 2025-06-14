resource "azurerm_resource_group" "rg_mela_prod" {
  name     = "rg-mela-prod"
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

  resource_group_name = azurerm_resource_group.rg_mela_prod.name
  cosmosdb_location   = "Southeast Asia"

  administrator_username          = "mela"
  cosmosdb_administrator_password = var.cosmosdb_administrator_password
  shard_count                     = "1"
  compute_tier                    = "M10"
  storage_size_in_gb              = "32"

  common_tags = var.common_tags
}


module "webapp" {
  source = "../modules/webapp"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_prod.name
  resource_group_location = azurerm_resource_group.rg_mela_prod.location
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
  redis_hostname                 = module.redis.hostname
  redis_primary_key              = module.redis.primary_access_key
  redis_port                     = module.redis.port
  storage_provider               = "azure"

  custom_hostname = "api.mela.guru"

  common_tags = var.common_tags

  depends_on = [module.openai, module.mongodb, module.redis, module.storage_account]
}

module "redis" {
  source = "../modules/redis"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_prod.name
  resource_group_location = azurerm_resource_group.rg_mela_prod.location

  capacity = 0
  family   = "C"
  sku_name = "Basic"

  common_tags = var.common_tags
}

module "storage_account" {
  source = "../modules/storage-account"
  env    = var.env

  resource_group_name        = azurerm_resource_group.rg_mela_prod.name
  resource_group_location    = azurerm_resource_group.rg_mela_prod.location
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  storage_account_containers = var.storage_account_containers

  common_tags = var.common_tags
}

module "openai" {
  source = "../modules/ai-service"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_prod.name
  openai_service_location = "Japan East"
  common_tags             = var.common_tags
}

module "static_webapp_landing_page" {
  source = "../modules/static-webapp"
  env    = var.env

  resource_group_name          = azurerm_resource_group.rg_mela_prod.name
  static_web_app_location      = "East Asia"
  static_web_app_name          = "static-app-mela-landing-page-${var.env}"
  static_web_app_custom_domain = "wwww.mela.guru"
  repository_url               = "https://github.com/mela-us/mela-landing-page"
  repository_branch            = "main"
  repository_token             = var.landing_page_github_token

  common_tags = var.common_tags
}

module "static_webapp_admin_page" {
  source = "../modules/static-webapp"
  env    = var.env

  resource_group_name          = azurerm_resource_group.rg_mela_prod.name
  static_web_app_location      = "East Asia"
  static_web_app_name          = "static-app-mela-admin-page-${var.env}"
  static_web_app_custom_domain = "admin.mela.guru"
  repository_url               = "https://github.com/mela-us/mela-admin-app"
  repository_branch            = "main"
  repository_token             = var.admin_page_github_token

  common_tags = var.common_tags
}