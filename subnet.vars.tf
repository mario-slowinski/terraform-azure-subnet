variable "address_prefixes" {
  type        = list(string)
  description = "The list of address prefixes to use for the subnet."
  default     = null
}

variable "delegations" {
  type = list(object({
    name = string # A name for this delegation.
    service_delegation = object({
      name    = string                 # The name of service to delegate to.
      actions = optional(list(string)) # A list of Actions which should be delegated.
    })
  }))
  description = "A delegation block."
  default = [
    {
      name = null
      service_delegation = {
        name = null
      }
    }
  ]
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "Enable or Disable network policies for the private endpoint on the subnet."
  default     = null
}

variable "private_link_service_network_policies_enabled" {
  type        = bool
  description = "Enable or Disable network policies for the private link service on the subnet."
  default     = null
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet."
  default     = null
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet."
  default     = null
}

variable "service_endpoint_policy_ids" {
  type        = list(string)
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  default     = null
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet."
  default     = null
}
