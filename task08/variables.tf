variable "name_prefix" {
  type = string
}
variable "location" {
  type = string
}
variable "acr_sku" {
  type = string
}
variable "app_image_name" {
  type = string
}
variable "git_repo_url" {
  type = string
}
variable "git_pat" {
  type      = string
  sensitive = true
}
variable "redis_capacity" {
  type = number
}
variable "redis_family" {
  type = string
}
variable "redis_sku" {
  type = string
}
variable "keyvault_sku" {
  type = string
}
variable "redis_hostname_secret_name" {
  type = string
}
variable "redis_primary_key_secret_name" {
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
