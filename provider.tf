provider "azurerm" {
  #  Caution
  # The ability to specify your Azure subscription credentials in a Terraform configuration file can be convenient - especially when testing. However, it isn't advisable to store credentials in a clear-text file that can be viewed by non-trusted individuals.
  subscription_id = local.envs["ARM_SUBSCRIPTION_ID"]
  client_id       = local.envs["ARM_CLIENT_ID"]
  client_secret   = local.envs["ARM_CLIENT_SECRET"]
  tenant_id       = local.envs["ARM_TENANT_ID"]
  features {}
}