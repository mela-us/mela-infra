resource "azurerm_monitor_workspace" "amw_shared_service" {
  name                = "amw-shared-service"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

resource "azurerm_dashboard_grafana" "grafana_shared_service" {
  name                = "gfn-shared-service"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  grafana_major_version = 11

  identity {
    type = "SystemAssigned"
  }

  azure_monitor_workspace_integrations {
    resource_id = azurerm_monitor_workspace.amw_shared_service.id
  }

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}
