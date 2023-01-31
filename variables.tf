module "common-tags" {
  source = "git@bitbucket.org:simployer/common-tags.git"

  # Mandatory variables
  environment = var.environment
  project     = var.project

  # My local tag
  tags = var.tags
}

locals {
  tags = module.common-tags.tags
}

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