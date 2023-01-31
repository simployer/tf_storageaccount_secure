resource "azurerm_storage_account" "this" {

  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  account_tier                    = "Standard"
  account_kind                    = "StorageV2"
  account_replication_type        = "ZRS"
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
        local.tags,
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

