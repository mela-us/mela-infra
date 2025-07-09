# monitoring

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.1 |
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
| [azurerm_dashboard_grafana.grafana_shared_service](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/dashboard_grafana) | resource |
| [azurerm_monitor_workspace.amw_shared_service](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/monitor_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags for all resources | `map(string)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | env | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource group in which the key vault will be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the key vault will be created. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
