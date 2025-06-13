# redis

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
| [azurerm_mongo_cluster.cosmos_mongodb_mela](https://registry.terraform.io/providers/hashicorp/azurerm/4.32.0/docs/resources/mongo_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_username"></a> [administrator\_username](#input\_administrator\_username) | The administrator username for the Cosmos DB. | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources. | `map(string)` | `{}` | no |
| <a name="input_compute_tier"></a> [compute\_tier](#input\_compute\_tier) | The compute tier for the Cosmos DB account. | `string` | n/a | yes |
| <a name="input_cosmos_administrator_password"></a> [cosmos\_administrator\_password](#input\_cosmos\_administrator\_password) | The administrator password for the Cosmos DB. | `string` | n/a | yes |
| <a name="input_cosmosdb_location"></a> [cosmosdb\_location](#input\_cosmosdb\_location) | The Azure region where the Cosmos DB account will be deployed. | `string` | n/a | yes |
| <a name="input_cosmosdb_name"></a> [cosmosdb\_name](#input\_cosmosdb\_name) | The name of the Cosmos DB. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment for which the App Service is being created (e.g., dev, uat, prod). | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the App Service will be created. | `string` | n/a | yes |
| <a name="input_shard_count"></a> [shard\_count](#input\_shard\_count) | The number of shards for the Cosmos DB account. | `string` | n/a | yes |
| <a name="input_storage_size_in_gb"></a> [storage\_size\_in\_gb](#input\_storage\_size\_in\_gb) | The storage size in GB for the Cosmos DB account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The connection string for the CosmosDB account |
<!-- END_TF_DOCS -->
