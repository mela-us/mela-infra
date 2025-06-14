resource "azurerm_static_web_app" "static_app_mela" {
  name                = var.static_web_app_name
  resource_group_name = var.resource_group_name
  location            = var.static_web_app_location

  repository_url    = var.repository_url
  repository_token  = var.repository_token
  repository_branch = var.repository_branch

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

resource "azurerm_static_web_app_custom_domain" "static_app_mela" {
  static_web_app_id = azurerm_static_web_app.static_app_mela.id
  domain_name       = var.static_web_app_custom_domain
  validation_type   = "cname-delegation"

  depends_on = [azurerm_static_web_app.static_app_mela]
}