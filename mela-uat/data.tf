data "azurerm_communication_service" "acs" {
  name                = "acs-mela"
  resource_group_name = "rg-shared-services"
}