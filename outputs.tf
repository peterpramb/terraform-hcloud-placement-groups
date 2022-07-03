# ============================================
# Manage placement groups in the Hetzner Cloud
# ============================================


# ------------
# Local Values
# ------------

locals {
  output_placement_groups = [
    for placement_group in hcloud_placement_group.placement_groups : placement_group
  ]
}


# -------------
# Output Values
# -------------

output "placement_groups" {
  description = "A list of all placement group objects."
  value       = local.output_placement_groups
}

output "placement_group_ids" {
  description = "A map of all placement group objects indexed by ID."
  value       = {
    for placement_group in local.output_placement_groups : placement_group.id => placement_group
  }
}

output "placement_group_names" {
  description = "A map of all placement group objects indexed by name."
  value       = {
    for placement_group in local.output_placement_groups : placement_group.name => placement_group
  }
}
