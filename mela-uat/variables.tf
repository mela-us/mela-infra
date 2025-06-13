variable "env" {
  type        = string
  description = "The environment for the deployment, e.g., dev, uat, prod"
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

variable "cosmosdb_administrator_password" {
  description = "The administrator password for the Cosmos DB account."
  type        = string
  sensitive   = true
}