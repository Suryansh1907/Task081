variable "resource_group_name" {
  description = "The name of the resource group where the Redis Cache will be deployed"
  type        = string
}
variable "location" {
  description = "The Azure region where the Redis Cache will be deployed"
  type        = string
}
variable "redis_name" {
  description = "The name of the Azure Redis Cache instance"
  type        = string
}
variable "capacity" {
  description = "The capacity of the Azure Redis Cache instance"
  type        = number
}
variable "family" {
  description = "The SKU family of the Azure Redis Cache instance"
  type        = string
}
variable "sku_name" {
  description = "The SKU name of the Azure Redis Cache instance"
  type        = string
}
variable "keyvault_id" {
  description = "The ID of the Azure Key Vault to store Redis secrets"
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
variable "tags" {
  description = "Tags to apply to the Redis Cache resources"
  type        = map(string)
}
