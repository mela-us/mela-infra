resource "azurerm_cognitive_account" "openai_mela" {
  name                = "oai-mela-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.openai_service_location

  kind     = "OpenAI"
  sku_name = "S0"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}
