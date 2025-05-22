variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "acr_name" {
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
variable "tags" {
  type = map(string)
}
