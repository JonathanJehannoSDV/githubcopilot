variable "location" {
  description = "Azure region where the infrastructure will be deployed."
  type        = string
  default     = "eastus"
}

variable "rg_name" {
  description = "Name of the Azure resource group."
  type        = string
  default     = "rg-terraform-azure"
}

variable "vm_size" {
  description = "SKU size for the Ubuntu virtual machine."
  type        = string
  default     = "Standard_B1s"
}