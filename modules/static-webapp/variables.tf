variable "env" {
  description = "The environment for which the App Service is being created (e.g., dev, uat, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the App Service will be created."
  type        = string
}

variable "static_web_app_location" {
  description = "The location of the Static Web App."
  type        = string
}

variable "static_web_app_name" {
  description = "The name of the Static Web App."
  type        = string
}

variable "static_web_app_custom_domain" {
  description = "The custom domain for the Static Web App."
  type        = string
}

variable "repository_url" {
  description = "The URL of the repository for the Static Web App."
  type        = string
}

variable "repository_token" {
  description = "The token for accessing the repository."
  type        = string
  sensitive   = true
}

variable "repository_branch" {
  description = "The branch of the repository to be used for the Static Web App."
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources created by this module."
  type        = map(string)
}
