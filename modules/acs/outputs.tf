output "communication_service_connection_string" {
  description = "The connection string for the email communication service"
  value       = azurerm_communication_service.acs_shared_services.primary_connection_string
}