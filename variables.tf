variable "resource_group_name" {
  type        = string
  description = "The resource group name to be imported"
  default     = "liatrio-drew"
}
variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the AKS cluster resources"
  default     = {}
}

