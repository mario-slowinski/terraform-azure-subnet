output "data" {
  description = "Subnet data."
  value       = length(var.address_prefixes) > 0 ? one(azurerm_subnet.this[*]) : one(data.azurerm_subnet.this[*])
  sensitive   = false
}
