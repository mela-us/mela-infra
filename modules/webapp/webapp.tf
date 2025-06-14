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

  app_settings = var.app_settings

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