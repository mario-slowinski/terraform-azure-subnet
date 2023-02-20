data "azurerm_subnet" "this" {
  count = length(var.address_prefixes) > 0 ? 0 : 1

  name                 = length(var.name) > 0 ? var.name : replace(join(var.separator, local.names), " ", var.space)
  virtual_network_name = length(var.virtual_network_name) > 0 ? var.virtual_network_name : replace(join(var.separator, local.names), " ", var.space)
  resource_group_name  = length(var.resource_group_name) > 0 ? var.resource_group_name : replace(join(var.separator, local.names), " ", var.space)
}

resource "azurerm_subnet" "this" {
  count = length(var.address_prefixes) > 0 ? 1 : 0

  name                 = length(var.name) > 0 ? var.name : replace(join(var.separator, local.names), " ", var.space)
  virtual_network_name = length(var.virtual_network_name) > 0 ? var.virtual_network_name : replace(join(var.separator, local.names), " ", var.space)
  resource_group_name  = length(var.resource_group_name) > 0 ? var.resource_group_name : replace(join(var.separator, local.names), " ", var.space)
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
}
