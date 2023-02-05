output "id" {
  description = "Storage account NAME Output"
  value       = azurerm_storage_account.this.id
}
output "name" {
  description = "Storage account NAME Output"
  value       = azurerm_storage_account.this.name
}

output "location" {
  description = "Storage account LOCATION Output"
  value       = azurerm_storage_account.this.location
}

output "resource_group_name" {
  description = "Storage account resource_group_name Output"
  value       = azurerm_storage_account.this.resource_group_name
}

output "account_tier" {
  description = "Storage account account_tier Output"
  value       = azurerm_storage_account.this.account_tier
}

output "account_replication_type" {
  description = "Storage account account_replication_type Output"
  value       = azurerm_storage_account.this.account_replication_type
}