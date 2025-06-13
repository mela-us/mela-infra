resource "azurerm_storage_account" "st_mela" {
  name                     = "stmela${var.env}001"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}