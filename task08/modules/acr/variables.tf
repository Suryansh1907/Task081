variable "resource_group_name" {
  description = "The name of the resource group where the ACR will be deployed"
  type        = string
}
variable "location" {
  description = "The Azure region where the ACR will be deployed"
  type        = string
}
variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}
variable "acr_sku" {
  description = "The SKU tier for the Azure Container Registry"
  type        = string
}
variable "app_image_name" {
  description = "The name of the Docker image to build and store in ACR"
  type        = string
}
variable "git_repo_url" {
  description = "The URL of the Git repository containing the application source code"
  type        = string
}
variable "git_pat" {
  description = "The personal access token for accessing the Git repository"
  type        = string
  sensitive   = true
}
variable "tags" {
  description = "Tags to apply to the ACR resources"
  type        = map(string)
}
