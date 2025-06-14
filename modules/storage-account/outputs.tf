output "storage_account_name" {
  value       = azurerm_storage_account.st_mela.name
  description = "The name of the storage account."
}

output "storage_account_primary_access_key" {
  value       = azurerm_storage_account.st_mela.primary_access_key
  description = "The primary access key of the storage account."
  sensitive   = true
}
