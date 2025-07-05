output "sender_email_address" {
  description = "The sender email address"
  value       = azurerm_email_communication_service_domain.ecs_domain_info_mela_guru_com.id
}

output "communication_service_connection_string" {
  description = "The connection string for the email communication service"
  value       = azurerm_communication_service.acs_shared_services.primary_connection_string

}