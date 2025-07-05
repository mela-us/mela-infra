resource "azurerm_communication_service" "acs_shared_services" {
  name                = "acs-shared-services"
  resource_group_name = var.resource_group_name
  data_location       = "Asia Pacific"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

resource "azurerm_email_communication_service" "ecs_shared_services" {
  name                = "ecs-shared-services"
  resource_group_name = var.resource_group_name
  data_location       = "Asia Pacific"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

resource "azurerm_email_communication_service_domain" "ecs_domain_info_mela_guru_com" {
  name              = "info.mela.guru"
  email_service_id  = azurerm_email_communication_service.ecs_shared_services.id
  domain_management = "CustomerManaged"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}


resource "azurerm_email_communication_service_domain" "ecs_domain_azure_managed" {
  name             = "AzureManagedDomain"
  email_service_id = azurerm_email_communication_service.ecs_shared_services.id

  domain_management = "AzureManaged"

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

resource "azurerm_communication_service_email_domain_association" "ecs_domain_assoc_azure_managed" {
  communication_service_id = azurerm_communication_service.acs_shared_services.id
  email_service_domain_id  = azurerm_email_communication_service_domain.ecs_domain_azure_managed.id
}

resource "azurerm_communication_service_email_domain_association" "ecs_domain_assoc_info_mela_guru_com" {
  communication_service_id = azurerm_communication_service.acs_shared_services.id
  email_service_domain_id  = azurerm_email_communication_service_domain.ecs_domain_info_mela_guru_com.id
}