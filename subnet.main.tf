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

  name                                          = coalesce(var.name, replace(join(var.separator, local.names), " ", var.space))
  private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  resource_group_name                           = coalesce(var.resource_group_name, replace(join(var.separator, local.names), " ", var.space))
  service_endpoints                             = var.service_endpoints
  virtual_network_name                          = coalesce(var.virtual_network_name, replace(join(var.separator, local.names), " ", var.space))
}
