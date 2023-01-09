variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet."
  default     = ""
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet."
  default     = ""
}

variable "address_prefixes" {
  type        = list(string)
  description = "The list of address prefixes to use for the subnet."
  default     = []
}
