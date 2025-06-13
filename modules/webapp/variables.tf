variable "resource_group_name" {
  description = "The name of the resource group in which the App Service will be created."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "env" {
  description = "The environment for which the App Service is being created (e.g., dev, uat, prod)."
  type        = string
}

variable "os_type" {
  description = "The operating system type for the App Service (e.g., Linux, Windows)."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., B1, S1, P1v2)."
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources created by this module."
  type        = map(string)
}
