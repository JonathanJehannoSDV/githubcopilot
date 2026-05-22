output "public_ips" {
  description = "Public IP addresses created by this stack."
  value = {
    vm = azurerm_public_ip.this.ip_address
  }
}

output "vm_public_ip" {
  description = "Public IP address of the Ubuntu VM."
  value       = azurerm_public_ip.this.ip_address
}