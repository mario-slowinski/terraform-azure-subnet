resource "azurerm_subnet" "this" {
  name                 = coalesce(var.name, replace(join(var.separator, local.names), " ", var.space))
  virtual_network_name = coalesce(var.virtual_network_name, replace(join(var.separator, local.names), " ", var.space))
  resource_group_name  = coalesce(var.resource_group_name, replace(join(var.separator, local.names), " ", var.space))
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
}
