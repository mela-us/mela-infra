resource "azurerm_service_plan" "asp_mela" {
  name                = "asp-mela-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "app_mela" {
  name                = "app-mela-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.asp_mela.id

  https_only = true

  site_config {
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = "https://ghcr.io"
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
  }

  app_settings = {
    "AZURE_OPEN_API_BASE_URL"             = var.azure_openai_endpoint
    "AZURE_OPENAI_API_KEY"                = var.azure_openai_api_key
    "AZURE_STORAGE_ACCOUNT_NAME"          = var.azure_storage_account_name
    "AZURE_STORAGE_ACCOUNT_KEY"           = var.azure_storage_account_key
    "JWT_FORGET_PASSWORD_SECRET_KEY"      = var.jwt_forget_password_secret_key
    "JWT_SECRET_KEY"                      = var.jwt_secret_key
    "MAIL_USERNAME"                       = var.mail_username
    "MAIL_PASSWORD"                       = var.mail_password
    "MONGODB_DB_CONNECTION_STRING"        = var.mongodb_db_connection_string
    "REDIS_HOST"                          = var.redis_hostname
    "REDIS_PRIMARY_KEY"                   = var.redis_primary_key
    "REDIS_PORT"                          = var.redis_port
    "STORAGE_PROVIDER"                    = var.storage_provider
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )

  lifecycle {
    ignore_changes = [
      site_config[0].application_stack[0].docker_image_name
    ]
  }
}


resource "azurerm_app_service_custom_hostname_binding" "custom_hostname_binding" {
  hostname            = var.custom_hostname
  app_service_name    = azurerm_linux_web_app.app_mela.name
  resource_group_name = var.resource_group_name

  depends_on = [
    azurerm_linux_web_app.app_mela
  ]
}

resource "azurerm_app_service_managed_certificate" "managed_cert" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_hostname_binding.id


  depends_on = [azurerm_app_service_custom_hostname_binding.custom_hostname_binding]
}

resource "azurerm_app_service_certificate_binding" "certificate_binding" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_hostname_binding.id
  certificate_id      = azurerm_app_service_managed_certificate.managed_cert.id
  ssl_state           = "SniEnabled"

  depends_on = [
    azurerm_app_service_managed_certificate.managed_cert,
    azurerm_app_service_custom_hostname_binding.custom_hostname_binding
  ]
}