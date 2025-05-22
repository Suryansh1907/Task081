variable "resource_group_name" {
  description = "The name of the resource group where the ACI will be deployed"
  type        = string
}
variable "location" {
  description = "The Azure region where the ACI will be deployed"
  type        = string
}
variable "aci_name" {
  description = "The name of the Azure Container Instance"
  type        = string
}
variable "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  type        = string
}
variable "acr_admin_username" {
  description = "The admin username for the Azure Container Registry"
  type        = string
}
variable "acr_admin_password" {
  description = "The admin password for the Azure Container Registry"
  type        = string
  sensitive   = true
}
variable "app_image_name" {
  description = "The name of the Docker image to deploy in ACI"
  type        = string
}
variable "redis_hostname" {
  description = "The hostname of the Azure Redis Cache instance"
  type        = string
}
variable "redis_primary_key" {
  description = "The primary access key for the Azure Redis Cache instance"
  type        = string
  sensitive   = true
}
variable "tags" {
  description = "Tags to apply to the ACI resources"
  type        = map(string)
}
