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
| [azurerm_app_service_certificate_binding.mela_certificate_binding](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/app_service_certificate_binding) | resource |
| [azurerm_app_service_custom_hostname_binding.mela_custom_hostname_binding](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/app_service_custom_hostname_binding) | resource |
| [azurerm_app_service_managed_certificate.managed_cert](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/app_service_managed_certificate) | resource |
| [azurerm_linux_web_app.app_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/linux_web_app) | resource |
| [azurerm_service_plan.asp_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_openai_api_key"></a> [azure\_openai\_api\_key](#input\_azure\_openai\_api\_key) | The API key for Azure OpenAI. | `string` | n/a | yes |
| <a name="input_azure_openai_endpoint"></a> [azure\_openai\_endpoint](#input\_azure\_openai\_endpoint) | The endpoint for Azure OpenAI. | `string` | n/a | yes |
| <a name="input_azure_storage_account_key"></a> [azure\_storage\_account\_key](#input\_azure\_storage\_account\_key) | The access key for the Azure Storage Account. | `string` | n/a | yes |
| <a name="input_azure_storage_account_name"></a> [azure\_storage\_account\_name](#input\_azure\_storage\_account\_name) | The name of the Azure Storage Account. | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources created by this module. | `map(string)` | n/a | yes |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | The name of the Docker image to be used for the App Service. | `string` | n/a | yes |
| <a name="input_docker_registry_password"></a> [docker\_registry\_password](#input\_docker\_registry\_password) | The password for the Docker registry. | `string` | n/a | yes |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | The username for the Docker registry. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment for which the App Service is being created (e.g., dev, uat, prod). | `string` | n/a | yes |
| <a name="input_jwt_forget_password_secret_key"></a> [jwt\_forget\_password\_secret\_key](#input\_jwt\_forget\_password\_secret\_key) | The secret key for JWT forget password functionality. | `string` | n/a | yes |
| <a name="input_jwt_secret_key"></a> [jwt\_secret\_key](#input\_jwt\_secret\_key) | The secret key for JWT authentication. | `string` | n/a | yes |
| <a name="input_mail_password"></a> [mail\_password](#input\_mail\_password) | The password for the mail service. | `string` | n/a | yes |
| <a name="input_mail_username"></a> [mail\_username](#input\_mail\_username) | The username for the mail service. | `string` | n/a | yes |
| <a name="input_mongodb_db_connection_string"></a> [mongodb\_db\_connection\_string](#input\_mongodb\_db\_connection\_string) | The connection string for the MongoDB database. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for the App Service (e.g., 'Linux', 'Windows'). | `string` | n/a | yes |
| <a name="input_redis_connection_string"></a> [redis\_connection\_string](#input\_redis\_connection\_string) | The connection string for the Redis instance. | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the App Service will be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the App Service Plan (e.g., 'B1', 'S1'). | `string` | n/a | yes |
| <a name="input_storage_provider"></a> [storage\_provider](#input\_storage\_provider) | The storage provider to be used (e.g., 'azure', 'aws'). | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
