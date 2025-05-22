variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be deployed"
  type        = string
}
variable "location" {
  description = "The Azure region where the Key Vault will be deployed"
  type        = string
}
variable "keyvault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}
variable "sku_name" {
  description = "The SKU name for the Azure Key Vault"
  type        = string
}
variable "tenant_id" {
  description = "The Azure tenant ID for the Key Vault"
  type        = string
}
variable "current_user_object_id" {
  description = "The object ID of the current user for Key Vault access policy"
  type        = string
}
variable "tags" {
  description = "Tags to apply to the Key Vault resources"
  type        = map(string)
}
