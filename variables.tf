variable "environment" {
  description = "development environment"
  type        = string
}

variable "project" {
  description = "project"
  type        = string
}
variable "name" {
  description = "Storage account resource name"
  type        = string
}

variable "location" {
  description = "Storage account location"
  type        = string
  default     = "West Europe"
}


variable "resource_group_name" {
  description = "Storage account group name"
  type        = string
}

variable "principal_ids" {
  description = "List of principal ids to grant access to the storage account"
  type        = list(string)
}