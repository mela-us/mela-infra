variable "env" {
  description = "The environment for which the App Service is being created (e.g., dev, uat, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "openai_service_location" {
  description = "The location for the OpenAI service."
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}