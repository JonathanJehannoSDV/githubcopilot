output "public_ip_addresses" {
  description = "Public IP addresses exposed by the infrastructure."
  value       = [azurerm_public_ip.this.ip_address]
}

output "public_ip_address" {
  description = "Public IP address of the Ubuntu VM."
  value       = azurerm_public_ip.this.ip_address
}

output "storage_account_name" {
  description = "Name of the created storage account."
  value       = azurerm_storage_account.this.name
}