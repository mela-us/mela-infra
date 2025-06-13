variable "env" {
  description = "The environment for which the App Service is being created (e.g., dev, uat, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the App Service will be created."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "os_type" {
  description = "The operating system type for the App Service (e.g., 'Linux', 'Windows')."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., 'B1', 'S1')."
  type        = string
}

variable "docker_image_name" {
  description = "The name of the Docker image to be used for the App Service."
  type        = string
}

variable "docker_registry_username" {
  description = "The username for the Docker registry."
  type        = string
}

variable "docker_registry_password" {
  description = "The password for the Docker registry."
  type        = string
  sensitive   = true
}

variable "azure_openai_endpoint" {
  description = "The endpoint for Azure OpenAI."
  type        = string
}

variable "azure_openai_api_key" {
  description = "The API key for Azure OpenAI."
  type        = string
  sensitive   = true
}

variable "azure_storage_account_name" {
  description = "The name of the Azure Storage Account."
  type        = string
}

variable "azure_storage_account_key" {
  description = "The access key for the Azure Storage Account."
  type        = string
  sensitive   = true
}

variable "jwt_forget_password_secret_key" {
  description = "The secret key for JWT forget password functionality."
  type        = string
  sensitive   = true
}

variable "jwt_secret_key" {
  description = "The secret key for JWT authentication."
  type        = string
  sensitive   = true
}

variable "mail_username" {
  description = "The username for the mail service."
  type        = string
}

variable "mail_password" {
  description = "The password for the mail service."
  type        = string
  sensitive   = true
}

variable "mongodb_db_connection_string" {
  description = "The connection string for the MongoDB database."
  type        = string
  sensitive   = true
}

variable "redis_connection_string" {
  description = "The connection string for the Redis instance."
  type        = string
  sensitive   = true
}

variable "storage_provider" {
  description = "The storage provider to be used (e.g., 'azure', 'aws')."
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources created by this module."
  type        = map(string)
}
