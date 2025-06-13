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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg_mela_uat](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags for all resources | `map(string)` | <pre>{<br/>  "app_name": "mela",<br/>  "app_owner": "mela-team",<br/>  "created_by": "tient"<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for the deployment, e.g., dev, uat, prod | `string` | `"prod"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
