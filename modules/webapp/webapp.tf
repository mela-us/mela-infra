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

  site_config {

  }

  app_settings = {

  }

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}