variable "ENVIRONMENT" {
  description = "development environment"
  type        = string
}

variable "PROJECT" {
  description = "project"
  type        = string
}
variable "NAME" {
  description = "Storage account resource name"
  type        = string
}

variable "LOCATION" {
  description = "Storage account location"
  type        = string
  default     = "West Europe"
}


variable "RESOURCE_GROUP_NAME" {
  description = "Storage account group name"
  type        = string
}