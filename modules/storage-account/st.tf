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


resource "azurerm_storage_container" "containers" {
  for_each              = toset(var.storage_account_containers)
  name                  = each.value
  storage_account_id    = azurerm_storage_account.st_mela.id
  container_access_type = "blob"
}
