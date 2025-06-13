output "connection_string" {
  description = "The connection string for the CosmosDB account"
  value       = azurerm_mongo_cluster.cosmos_mongodb_mela.connection_strings[0].value
  sensitive   = true
}
