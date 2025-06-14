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
| [azurerm_static_web_app.static_app_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/static_web_app) | resource |
| [azurerm_static_web_app_custom_domain.static_app_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/static_web_app_custom_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources created by this module. | `map(string)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment for which the App Service is being created (e.g., dev, uat, prod). | `string` | n/a | yes |
| <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch) | The branch of the repository to be used for the Static Web App. | `string` | n/a | yes |
| <a name="input_repository_token"></a> [repository\_token](#input\_repository\_token) | The token for accessing the repository. | `string` | n/a | yes |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | The URL of the repository for the Static Web App. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the App Service will be created. | `string` | n/a | yes |
| <a name="input_static_web_app_custom_domain"></a> [static\_web\_app\_custom\_domain](#input\_static\_web\_app\_custom\_domain) | The custom domain for the Static Web App. | `string` | n/a | yes |
| <a name="input_static_web_app_location"></a> [static\_web\_app\_location](#input\_static\_web\_app\_location) | The location of the Static Web App. | `string` | n/a | yes |
| <a name="input_static_web_app_name"></a> [static\_web\_app\_name](#input\_static\_web\_app\_name) | The name of the Static Web App. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
