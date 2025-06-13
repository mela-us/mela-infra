variable "env" {
  type        = string
  description = "The environment for the deployment, e.g., dev, uat, prod"
}

# webapp variables
variable "docker_registry_username" {
  description = "The username for the Docker registry."
  type        = string
}

variable "docker_registry_password" {
  description = "The password for the Docker registry."
  type        = string
  sensitive   = true
}

variable "azure_openai_api_key" {
  description = "The API key for Azure OpenAI."
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

variable "redis_host" {
  description = "The host for the Redis instance."
  type        = string
}

variable "redis_port" {
  description = "The port for the Redis instance."
  type        = number
}

variable "redis_username" {
  description = "The username for the Redis instance."
  type        = string
}

variable "redis_password" {
  description = "The password for the Redis instance."
  type        = string
  sensitive   = true
}

# cosmosdb variables
variable "cosmosdb_administrator_password" {
  description = "The administrator password for the Cosmos DB account."
  type        = string
  sensitive   = true
}

variable "common_tags" {
  type = map(string)
  default = {
    created_by = "tient"
    app_name   = "mela"
    app_owner  = "mela-team"
  }
  description = "Common tags for all resources"
}

