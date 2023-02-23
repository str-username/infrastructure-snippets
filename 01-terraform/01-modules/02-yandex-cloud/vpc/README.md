<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.85.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.85.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_gateway.this](https://registry.terraform.io/providers/yandex-cloud/yandex/0.85.0/docs/resources/vpc_gateway) | resource |
| [yandex_vpc_network.this](https://registry.terraform.io/providers/yandex-cloud/yandex/0.85.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_route_table.this](https://registry.terraform.io/providers/yandex-cloud/yandex/0.85.0/docs/resources/vpc_route_table) | resource |
| [yandex_vpc_subnet.main](https://registry.terraform.io/providers/yandex-cloud/yandex/0.85.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | Global labes that's add to vpc, subnets, rt, gw | `map(any)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets settings | <pre>object({<br>    v4_cidr_blocks = list(string)<br>    zone           = string<br>    name           = string<br>    description    = optional(string, null)<br>    dhcp_options   = optional(map(any), {})<br>  })</pre> | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Vpc network settings | <pre>object({<br>    name        = string<br>    description = optional(string, null)<br>    folder_id   = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->