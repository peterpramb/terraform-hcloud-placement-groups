# ============================================
# Manage placement groups in the Hetzner Cloud
# ============================================


# ---------------
# Input Variables
# ---------------

variable "placement_groups" {
  description = "The list of placement groups to be managed. Each placement group object supports the following parameters: 'name' (string, required), 'type' (string, required), 'labels' (map of KV pairs, optional)."

  type        = list(
    object({
      name   = string
      type   = string
      labels = map(string)
    })
  )

  default     = [
    {
      name   = "placement-group-1"
      type   = "spread"
      labels = {}
    }
  ]

  validation {
    condition     = can([
      for placement_group in var.placement_groups : regex("\\w+", placement_group.name)
    ])
    error_message = "All placement groups must have a valid 'name' attribute specified."
  }

  validation {
    condition     = can([
      for placement_group in var.placement_groups : regex("\\w+", placement_group.type)
    ])
    error_message = "All placement groups must have a valid 'type' attribute specified."
  }
}
