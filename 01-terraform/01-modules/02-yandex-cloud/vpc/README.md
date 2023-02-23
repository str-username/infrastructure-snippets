<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.78.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.78.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_gateway.main](https://registry.terraform.io/providers/yandex-cloud/yandex/0.78.2/docs/resources/vpc_gateway) | resource |
| [yandex_vpc_network.main](https://registry.terraform.io/providers/yandex-cloud/yandex/0.78.2/docs/resources/vpc_network) | resource |
| [yandex_vpc_route_table.main](https://registry.terraform.io/providers/yandex-cloud/yandex/0.78.2/docs/resources/vpc_route_table) | resource |
| [yandex_vpc_subnet.main](https://registry.terraform.io/providers/yandex-cloud/yandex/0.78.2/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnet_labels"></a> [subnet\_labels](#input\_subnet\_labels) | n/a | `any` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_vpc_description"></a> [vpc\_description](#input\_vpc\_description) | n/a | `any` | n/a | yes |
| <a name="input_vpc_folder_id"></a> [vpc\_folder\_id](#input\_vpc\_folder\_id) | n/a | `any` | n/a | yes |
| <a name="input_vpc_labels"></a> [vpc\_labels](#input\_vpc\_labels) | n/a | `any` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->