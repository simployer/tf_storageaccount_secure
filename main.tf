resource "azurerm_storage_account" "this" {

  name                            = var.NAME
  location                        = var.LOCATION
  resource_group_name             = var.RESOURCE_GROUP_NAME
  account_tier                    = "Standard"
  account_kind                    = "StorageV2"
  account_replication_type        = "GRS"
  access_tier                     = "Hot"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false
  default_to_oauth_authentication = true
  allowed_copy_scope              = "AAD"
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"

  lifecycle {
    ignore_changes = [
      tags["intilityImplementationGuid"], tags["intilityManaged"]
    ]
  }
  #merge tags with common tags
    tags = merge(
        module.common.tags,
        {
        "type" = "terraformstate"
        }
    )
  
 blob_properties {
    delete_retention_policy {
      days = 30
    }
    container_delete_retention_policy {
      days = 30
    }
   
}
}

resource "azurerm_storage_account_network_rules" "vnet" {
  storage_account_id = azurerm_storage_account.this.id
  default_action       = "Deny"
  virtual_network_subnet_ids = module.common.buildsubnets
  ip_rules = module.common.internal_gateway_ips
}

module "common" {
  source = "git::http://simployer:simployer@gitserver.simployer.tech/terraform-modules-common.git"
  project = var.PROJECT
  environment = var.ENVIRONMENT
}