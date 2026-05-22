variable "location" {
  type        = string
  description = "Azure region where resources will be deployed."
  default     = "westeurope"
}

variable "rg_name" {
  type        = string
  description = "Name of the Azure resource group."
  default     = "rg-terraform-training"
}

variable "vm_size" {
  type        = string
  description = "Size of the Ubuntu virtual machine."
  default     = "Standard_B2s"
}