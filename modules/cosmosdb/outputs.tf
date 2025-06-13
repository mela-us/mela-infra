output "connection_string" {
  description = "The connection string for the CosmosDB account"
  value       = azurerm_cosmosdb_account.cosmosdb.connection_strings[0].value
  sensitive   = true
}
