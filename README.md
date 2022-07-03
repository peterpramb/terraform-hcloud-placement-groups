[![License](https://img.shields.io/github/license/peterpramb/terraform-hcloud-placement-groups)](https://github.com/peterpramb/terraform-hcloud-placement-groups/blob/master/LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/peterpramb/terraform-hcloud-placement-groups?sort=semver)](https://github.com/peterpramb/terraform-hcloud-placement-groups/releases/latest)
[![Terraform Version](https://img.shields.io/badge/terraform-%E2%89%A5%200.13.0-623ce4)](https://www.terraform.io)


# terraform-hcloud-placement-groups

[Terraform](https://www.terraform.io) module for managing placement groups in the [Hetzner Cloud](https://www.hetzner.com/cloud).

It implements the following [provider](#providers) resources:

- [hcloud\_placement\_group](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group)


## Usage

```terraform
module "placement_group" {
  source           = "github.com/peterpramb/terraform-hcloud-placement-groups?ref=<release>"

  placement_groups = [
    {
      name   = "distributed"
      type   = "spread"
      labels = {
        "managed"    = "true"
        "managed_by" = "Terraform"
      }
    }
  ]
}
```


## Requirements

| Name | Version |
|------|---------|
| [terraform](https://www.terraform.io) | &ge; 0.13 |


## Providers

| Name | Version |
|------|---------|
| [hcloud](https://registry.terraform.io/providers/hetznercloud/hcloud) | &ge; 1.29 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| placement\_groups | List of placement group objects to be managed. | list(map([*placement\_group*](#placement_group))) | See [below](#defaults) | yes |


#### *placement\_group*

| Name | Description | Type | Required |
|------|-------------|:----:|:--------:|
| [name](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group#name) | Unique name of the placement group. | string | yes |
| [type](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group#type) | Type of the placement group. | string | yes |
| [labels](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group#labels) | Map of user-defined labels. | map(string) | no |


### Defaults

```terraform
placement_groups = [
  {
    name   = "placement-group-1"
    type   = "spread"
    labels = {}
  }
]
```


## Outputs

| Name | Description |
|------|-------------|
| placement\_groups | List of all placement group objects. |
| placement\_group\_ids | Map of all placement group objects indexed by ID. |
| placement\_group\_names | Map of all placement group objects indexed by name. |


### Defaults

```terraform
placement_groups = [
  {
    "id" = "57826"
    "name" = "placement-group-1"
    "servers" = []
    "type" = "spread"
  },
]

placement_group_ids = {
  "57826" = {
    "id" = "57826"
    "name" = "placement-group-1"
    "servers" = []
    "type" = "spread"
  }
}

placement_group_names = {
  "placement-group-1" = {
    "id" = "57826"
    "name" = "placement-group-1"
    "servers" = []
    "type" = "spread"
  }
}
```


## License

This module is released under the [MIT](https://github.com/peterpramb/terraform-hcloud-placement-groups/blob/master/LICENSE) License.
