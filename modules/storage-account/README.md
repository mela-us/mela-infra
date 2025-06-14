# Storage Account

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
| [azurerm_storage_account.st_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.containers](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | The replication type of the storage account (e.g., LRS, GRS, ZRS). | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | The tier of the storage account (e.g., Standard, Premium). | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources. | `map(string)` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment for which the storage account is being created (e.g., dev, test, prod). | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_storage_account_containers"></a> [storage\_account\_containers](#input\_storage\_account\_containers) | List of storage containers to be created in the storage account. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the storage account. |
| <a name="output_storage_account_primary_access_key"></a> [storage\_account\_primary\_access\_key](#output\_storage\_account\_primary\_access\_key) | The primary access key of the storage account. |
<!-- END_TF_DOCS -->
