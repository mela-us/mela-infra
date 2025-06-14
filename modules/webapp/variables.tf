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

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}

variable "web_app_name" {
  description = "The name of the Web App."
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

variable "custom_hostname" {
  description = "The custom hostname for the App Service."
  type        = string
}

variable "app_settings" {
  description = "A map of application settings to be applied to the App Service."
  type        = map(string)
  default     = {}
}

variable "common_tags" {
  description = "Common tags to be applied to all resources created by this module."
  type        = map(string)
}
