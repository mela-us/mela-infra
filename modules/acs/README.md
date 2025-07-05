<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_communication_service.acs_shared_services](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/communication_service) | resource |
| [azurerm_communication_service_email_domain_association.ecs_domain_assoc_azure_managed](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/communication_service_email_domain_association) | resource |
| [azurerm_communication_service_email_domain_association.ecs_domain_assoc_info_mela_guru_com](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/communication_service_email_domain_association) | resource |
| [azurerm_email_communication_service.ecs_shared_services](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/email_communication_service) | resource |
| [azurerm_email_communication_service_domain.ecs_domain_azure_managed](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/email_communication_service_domain) | resource |
| [azurerm_email_communication_service_domain.ecs_domain_info_mela_guru_com](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/email_communication_service_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_communication_service_connection_string"></a> [communication\_service\_connection\_string](#output\_communication\_service\_connection\_string) | The connection string for the email communication service |
<!-- END_TF_DOCS -->
