resource "azurerm_resource_group" "rg_mela_uat" {
  name     = "rg-mela-uat"
  location = "Southeast Asia"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

module "mongodb" {
  source = "../modules/cosmosdb"

  cosmosdb_name = "mela-cosmosdb-uat"
  env           = var.env

  resource_group_name = azurerm_resource_group.rg_mela_uat.name
  cosmosdb_location   = azurerm_resource_group.rg_mela_uat.location

  administrator_username        = "mela"
  cosmos_administrator_password = var.cosmos_administrator_password
  shard_count                   = "1"
  compute_tier                  = "M10"
  storage_size_in_gb            = "32"

  common_tags = var.common_tags
}


module "webapp" {
  source = "../modules/webapp"
  env    = var.env

  resource_group_name     = azurerm_resource_group.rg_mela_uat.name
  resource_group_location = azurerm_resource_group.rg_mela_uat.location
  os_type                 = "Linux"
  sku_name                = "B1"

  common_tags = var.common_tags
}
