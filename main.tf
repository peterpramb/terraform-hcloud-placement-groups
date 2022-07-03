# ============================================
# Manage placement groups in the Hetzner Cloud
# ============================================


# ------------
# Local Values
# ------------

locals {
  # Build a map of all provided placement group objects, indexed by placement group name:
  placement_groups = {
    for placement_group in var.placement_groups : placement_group.name => placement_group
  }
}


# ----------------
# Placement Groups
# ----------------

resource "hcloud_placement_group" "placement_groups" {
  for_each = local.placement_groups

  name     = each.value.name
  type     = each.value.type

  labels   = each.value.labels
}
