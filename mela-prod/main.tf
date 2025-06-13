resource "azurerm_resource_group" "rg_mela_uat" {
  name     = "rg-mela-prod"
  location = "Southeast Asia"

  tags = merge(
    var.common_tags,
    {
      environment = var.environment
    }
  )
}