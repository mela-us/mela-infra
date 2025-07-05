data "azurerm_communication_service" "acs" {
  name                = "acs-mela"
  resource_group_name = data.azurerm_resource_group.rg_shared_services.name
}

data "azurerm_resource_group" "rg_shared_services" {
  name = "rg-shared-services"
}