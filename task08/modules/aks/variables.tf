variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be deployed"
  type        = string
}
variable "location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
}
variable "aks_name" {
  description = "The name of the Azure Kubernetes Service cluster"
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
variable "acr_id" {
  description = "The ID of the Azure Container Registry for AKS to pull images"
  type        = string
}
variable "keyvault_id" {
  description = "The ID of the Azure Key Vault for AKS to access secrets"
  type        = string
}
variable "tenant_id" {
  description = "The Azure tenant ID for the AKS cluster"
  type        = string
}
variable "tags" {
  description = "Tags to apply to the AKS resources"
  type        = map(string)
}
