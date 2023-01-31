usage:

´´´
module "st" {
  source                          = "git@github.com:simployer/tf_storageaccount_secure.git"
  name                            = "st${var.ENV-SHORT}${var.PROJECT}"
  location                        = module.rg.location
  resource_group_name             = module.rg.name
  project                         = var.PROJECT
  environment                     = var.ENVIRONMENT
  principal_id                    = data.azuread_service_principal.sp.object_id
}
´´´

principal_id is the objectid of the serviceprincipal that will get access to the storage account's terraform container