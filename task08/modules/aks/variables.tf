variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "aks_name" {
  type = string
}
variable "node_pool_name" {
  type = string
}
variable "node_count" {
  type = number
}
variable "node_size" {
  type = string
}
variable "os_disk_type" {
  type = string
}
variable "acr_id" {
  type = string
}
variable "keyvault_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "tags" {
  type = map(string)
}
