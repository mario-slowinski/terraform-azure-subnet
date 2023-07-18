resource "azurerm_subnet" "this" {
  address_prefixes = var.address_prefixes

  dynamic "delegation" {
    for_each = {
      for delegation in var.delegations :
      delegation.name => delegation
      if delegation.name != null
    }
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }

  name                                          = coalesce(var.name, local.name)
  private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  resource_group_name                           = coalesce(var.resource_group_name, local.name)
  service_endpoints                             = var.service_endpoints
  service_endpoint_policy_ids                   = var.service_endpoint_policy_ids
  virtual_network_name                          = coalesce(var.virtual_network_name, local.name)
}
