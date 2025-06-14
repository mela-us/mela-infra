resource "azurerm_service_plan" "asp_mela_admin" {
  name                = "asp-mela-admin-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "app_mela_admin" {
  name                = "app-mela-admin-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.asp_mela_admin.id

  https_only = true

  site_config {
    application_stack {
      node_version = "22-lts"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

resource "azurerm_app_service_source_control" "source_control" {
  app_id   = azurerm_linux_web_app.app_mela_admin.id
  repo_url = var.admin_app_repository_url
  branch   = var.admin_app_branch
}

resource "azurerm_app_service_custom_hostname_binding" "custom_hostname_binding" {
  hostname            = var.custom_hostname
  app_service_name    = azurerm_linux_web_app.app_mela_admin.name
  resource_group_name = var.resource_group_name

  depends_on = [
    azurerm_linux_web_app.app_mela_admin
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