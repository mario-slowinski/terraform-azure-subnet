output "data" {
  description = "Subnet data."
  value       = azurerm_subnet.this
  sensitive   = false
}
