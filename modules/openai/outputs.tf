output "primary_access_key" {
  value       = azurerm_cognitive_account.openai_mela.primary_access_key
  description = "Primary access key for the OpenAI Cognitive Account"
  sensitive   = true
}