variable "name_prefix" {
  description = "The prefix used for naming all resources"
  type        = string
}
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}
variable "acr_sku" {
  description = "The SKU tier for the Azure Container Registry"
  type        = string
}
variable "app_image_name" {
  description = "The name of the Docker image to build and deploy"
  type        = string
}
variable "git_repo_url" {
  description = "The URL of the Git repository containing the application source code"
  type        = string
  default     = "https://github.com/Suryansh1907/Task081.git"
}
variable "git_pat" {
  description = "The personal access token for accessing the Git repository"
  type        = string
  sensitive   = true
}
variable "redis_capacity" {
  description = "The capacity of the Azure Redis Cache instance"
  type        = number
}
variable "redis_family" {
  description = "The SKU family of the Azure Redis Cache instance"
  type        = string
}
variable "redis_sku" {
  description = "The SKU name of the Azure Redis Cache instance"
  type        = string
}
variable "keyvault_sku" {
  description = "The SKU name for the Azure Key Vault"
  type        = string
}
variable "redis_hostname_secret_name" {
  description = "The name of the Key Vault secret for the Redis hostname"
  type        = string
}
variable "redis_primary_key_secret_name" {
  description = "The name of the Key Vault secret for the Redis primary key"
  type        = string
}
variable "node_pool_name" {
  description = "The name of the default node pool in the AKS cluster"
  type        = string
}
variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}
variable "node_size" {
  description = "The VM size for the nodes in the default node pool"
  type        = string
}
variable "os_disk_type" {
  description = "The OS disk type for the nodes in the default node pool"
  type        = string
}
