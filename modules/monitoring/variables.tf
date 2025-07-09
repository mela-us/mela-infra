variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the key vault will be created."
}

variable "resource_group_location" {
  type        = string
  description = "The location of the resource group in which the key vault will be created."
}

variable "env" {
  type        = string
  description = "env"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
