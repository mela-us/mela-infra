variable "env" {
  description = "The environment for which the App Service is being created (e.g., dev, uat, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the App Service will be created."
  type        = string
}

variable "cosmosdb_location" {
  description = "The Azure region where the Cosmos DB account will be deployed."
  type        = string
}


variable "administrator_username" {
  description = "The administrator username for the Cosmos DB."
  type        = string
}

variable "cosmosdb_administrator_password" {
  description = "The administrator password for the Cosmos DB."
  type        = string
  sensitive   = true
}

variable "shard_count" {
  description = "The number of shards for the Cosmos DB account."
  type        = string
}

variable "compute_tier" {
  description = "The compute tier for the Cosmos DB account."
  type        = string
}

variable "storage_size_in_gb" {
  description = "The storage size in GB for the Cosmos DB account."
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}