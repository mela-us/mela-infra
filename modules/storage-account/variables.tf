variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "env" {
  description = "The environment for which the storage account is being created (e.g., dev, test, prod)."
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account (e.g., Standard, Premium)."
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account (e.g., LRS, GRS, ZRS)."
  type        = string
}

variable "storage_account_containers" {
  type        = list(string)
  description = "List of storage containers to be created in the storage account."
  default     = []
}

variable "common_tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}