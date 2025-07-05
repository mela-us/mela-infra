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

resource "azurerm_resource_group" "rg_shared_services" {
  name     = "rg-shared-services"
  location = "Southeast Asia"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

module "acs" {
  source = "../modules/acs"
  env    = var.env

  resource_group_name = azurerm_resource_group.rg_shared_services.name
  common_tags         = var.common_tags
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


module "app_mela_api" {
  source = "../modules/webapp"
  env    = var.env

  app_service_name = "asp-mela-api-${var.env}"
  web_app_name     = "app-mela-api-${var.env}"

  resource_group_name     = azurerm_resource_group.rg_mela_prod.name
  resource_group_location = azurerm_resource_group.rg_mela_prod.location
  os_type                 = "Linux"
  sku_name                = "B1"

  app_settings = {
    "AZURE_OPEN_API_BASE_URL"                       = module.openai.endpoint
    "AZURE_OPENAI_API_KEY"                          = module.openai.primary_access_key
    "AZURE_STORAGE_ACCOUNT_NAME"                    = module.storage_account.storage_account_name
    "AZURE_STORAGE_ACCOUNT_KEY"                     = module.storage_account.storage_account_primary_access_key
    "JWT_FORGET_PASSWORD_SECRET_KEY"                = var.jwt_forget_password_secret_key
    "JWT_SECRET_KEY"                                = var.jwt_secret_key
    "AZURE_SENDER_EMAIL_ADDRESS"                    = "DoNotReply@info.mela.guru"
    "AZURE_COMMUNICATION_SERVICE_CONNECTION_STRING" = module.acs.communication_service_connection_string
    "MONGODB_DB_CONNECTION_STRING"                  = module.mongodb.connection_string
    "REDIS_HOST"                                    = module.redis.hostname
    "REDIS_PRIMARY_KEY"                             = module.redis.primary_access_key
    "REDIS_PORT"                                    = module.redis.port
    "STORAGE_PROVIDER"                              = "azure"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"           = "false"
  }

  docker_image_name        = var.mela_api_docker_image_name
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password

  custom_hostname = "api.mela.guru"

  common_tags = var.common_tags

  depends_on = [module.openai, module.mongodb, module.redis, module.storage_account]
}

module "app_mela_admin_page" {
  source = "../modules/webapp"
  env    = var.env

  app_service_name = "asp-mela-admin-page-${var.env}"
  web_app_name     = "app-mela-admin-page-${var.env}"

  resource_group_name     = azurerm_resource_group.rg_mela_prod.name
  resource_group_location = azurerm_resource_group.rg_mela_prod.location
  os_type                 = "Linux"
  sku_name                = "B1"

  docker_image_name        = var.mela_admin_page_docker_image_name
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password

  custom_hostname = "admin.mela.guru"

  common_tags = var.common_tags
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
  static_web_app_custom_domain = "www.mela.guru"
  repository_url               = "https://github.com/mela-us/mela-landing-page"
  repository_branch            = "main"
  repository_token             = var.landing_page_github_token

  common_tags = var.common_tags
}
