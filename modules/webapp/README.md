# Web app

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
| [azurerm_app_service_certificate_binding.certificate_binding](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/app_service_certificate_binding) | resource |
| [azurerm_app_service_custom_hostname_binding.custom_hostname_binding](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/app_service_custom_hostname_binding) | resource |
| [azurerm_app_service_managed_certificate.managed_cert](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/app_service_managed_certificate) | resource |
| [azurerm_linux_web_app.app_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/linux_web_app) | resource |
| [azurerm_service_plan.asp_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | The name of the App Service. | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of application settings to be applied to the App Service. | `map(string)` | `{}` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources created by this module. | `map(string)` | n/a | yes |
| <a name="input_custom_hostname"></a> [custom\_hostname](#input\_custom\_hostname) | The custom hostname for the App Service. | `string` | n/a | yes |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | The name of the Docker image to be used for the App Service. | `string` | n/a | yes |
| <a name="input_docker_registry_password"></a> [docker\_registry\_password](#input\_docker\_registry\_password) | The password for the Docker registry. | `string` | n/a | yes |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | The username for the Docker registry. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment for which the App Service is being created (e.g., dev, uat, prod). | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for the App Service (e.g., 'Linux', 'Windows'). | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the App Service will be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the App Service Plan (e.g., 'B1', 'S1'). | `string` | n/a | yes |
| <a name="input_web_app_name"></a> [web\_app\_name](#input\_web\_app\_name) | The name of the Web App. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
