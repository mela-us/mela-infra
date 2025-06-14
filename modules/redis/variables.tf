variable "env" {
  description = "The environment for which the Redis instance is being created (e.g., dev, uat, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "capacity" {
  description = "The capacity of the Redis cache instance."
  type        = number
}

variable "family" {
  description = "The family of the Redis cache instance."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Redis cache instance."
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}