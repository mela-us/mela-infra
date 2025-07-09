# Mela Terraform

Mela Terraform

## Owner

[@msn/infra-team](CODEOWNERS)

## Contributing

See [Contribute Guide](/CONTRIBUTING.md)

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acs"></a> [acs](#module\_acs) | ../modules/acs | n/a |
| <a name="module_app_mela_admin_page"></a> [app\_mela\_admin\_page](#module\_app\_mela\_admin\_page) | ../modules/webapp | n/a |
| <a name="module_app_mela_api"></a> [app\_mela\_api](#module\_app\_mela\_api) | ../modules/webapp | n/a |
| <a name="module_mongodb"></a> [mongodb](#module\_mongodb) | ../modules/cosmosdb | n/a |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | ../modules/monitoring | n/a |
| <a name="module_openai"></a> [openai](#module\_openai) | ../modules/ai-service | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ../modules/redis | n/a |
| <a name="module_static_webapp_landing_page"></a> [static\_webapp\_landing\_page](#module\_static\_webapp\_landing\_page) | ../modules/static-webapp | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../modules/storage-account | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg_mela_prod](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/resource_group) | resource |
| [azurerm_resource_group.rg_shared_services](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags for all resources | `map(string)` | <pre>{<br/>  "app_name": "mela",<br/>  "app_owner": "mela-team",<br/>  "created_by": "tient"<br/>}</pre> | no |
| <a name="input_cosmosdb_administrator_password"></a> [cosmosdb\_administrator\_password](#input\_cosmosdb\_administrator\_password) | The administrator password for CosmosDB. | `string` | n/a | yes |
| <a name="input_docker_registry_password"></a> [docker\_registry\_password](#input\_docker\_registry\_password) | The password for the Docker registry. | `string` | n/a | yes |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | The username for the Docker registry. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment for the deployment, e.g., dev, uat, prod | `string` | n/a | yes |
| <a name="input_jwt_forget_password_secret_key"></a> [jwt\_forget\_password\_secret\_key](#input\_jwt\_forget\_password\_secret\_key) | The secret key for JWT forget password functionality. | `string` | n/a | yes |
| <a name="input_jwt_secret_key"></a> [jwt\_secret\_key](#input\_jwt\_secret\_key) | The secret key for JWT authentication. | `string` | n/a | yes |
| <a name="input_landing_page_github_token"></a> [landing\_page\_github\_token](#input\_landing\_page\_github\_token) | GitHub token for the landing page static web app. | `string` | n/a | yes |
| <a name="input_mela_admin_page_docker_image_name"></a> [mela\_admin\_page\_docker\_image\_name](#input\_mela\_admin\_page\_docker\_image\_name) | The name of the Docker image to be used for the Admin Page App Service. | `string` | n/a | yes |
| <a name="input_mela_api_docker_image_name"></a> [mela\_api\_docker\_image\_name](#input\_mela\_api\_docker\_image\_name) | The name of the Docker image to be used for the App Service. | `string` | n/a | yes |
| <a name="input_storage_account_containers"></a> [storage\_account\_containers](#input\_storage\_account\_containers) | List of storage containers to be created in the storage account. | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
