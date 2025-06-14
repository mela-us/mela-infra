variable "env" {
  type        = string
  description = "The environment for the deployment, e.g., dev, uat, prod"
}

# webapp variables
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

# CosmosDB variables
variable "cosmosdb_administrator_password" {
  description = "The administrator password for CosmosDB."
  type        = string
  sensitive   = true
}

variable "storage_account_containers" {
  type        = list(string)
  description = "List of storage containers to be created in the storage account."
  default     = []
}

# Static Web App variables
variable "landing_page_github_token" {
  description = "GitHub token for the landing page static web app."
  type        = string
  sensitive   = true
}

variable "admin_page_github_token" {
  description = "GitHub token for the admin page static web app."
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

