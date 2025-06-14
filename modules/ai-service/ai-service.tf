resource "azurerm_ai_services" "openai_mela" {
  name                  = "oai-mela-${var.env}"
  resource_group_name   = var.resource_group_name
  location              = var.openai_service_location
  public_network_access = "Enabled"
  sku_name              = "S0"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}