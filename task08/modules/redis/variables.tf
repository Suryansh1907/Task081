variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "redis_name" {
  type = string
}
variable "capacity" {
  type = number
}
variable "family" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "keyvault_id" {
  type = string
}
variable "redis_hostname_secret_name" {
  type = string
}
variable "redis_primary_key_secret_name" {
  type = string
}
variable "tags" {
  type = map(string)
}
