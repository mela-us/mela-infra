output "primary_access_key" {
  value       = azurerm_ai_services.openai_mela.primary_access_key
  description = "Primary access key for the OpenAI AI Services"
  sensitive   = true
}