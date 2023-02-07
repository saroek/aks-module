variable "resource_group_name" {
  type        = string
  description = "(required) AKS resource group"
}

variable "location" {
  type        = string
  description = "(required) AKS location"
}

variable "default_node_pool" {
  type = object({
    name       = string
    node_count = string
    vm_size    = string
  })
  description = "(required) the default node pool"
}

variable "enable_service_principal" {
  type        = bool
  description = "(required) set to enable service principal"
  default     = false
}

variable "prefix" {
    type = string
    description = "(optional) aks cluster prefix"
    default = ""
}
