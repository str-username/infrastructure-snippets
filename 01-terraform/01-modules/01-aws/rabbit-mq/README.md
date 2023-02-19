<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.51.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_mq_broker.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Apply mq changes immediately | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Upgrade minor version automatically | `bool` | `false` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | Deployment mode of the broker, if instance type not mq.t3.micro | `string` | `"SINGLE_INSTANCE"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | RabbitMQ instance size, only mq.m5 classes supported | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key id that's will be used for encryption | `string` | `null` | no |
| <a name="input_logs_general"></a> [logs\_general](#input\_logs\_general) | Enabled general logs | `bool` | `false` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance parameters | <pre>object({<br>    day_of_week = string<br>    time_of_day = string<br>    time_zone   = string<br>  })</pre> | <pre>{<br>  "day_of_week": "MONDAY",<br>  "time_of_day": "00:00",<br>  "time_zone": "CET"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | RabbitMQ broker name | `string` | n/a | yes |
| <a name="input_public_access"></a> [public\_access](#input\_public\_access) | Publish RabbitMQ to public | `bool` | `false` | no |
| <a name="input_rabbit_version"></a> [rabbit\_version](#input\_rabbit\_version) | RabbitMQ broker engine version | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of the security groups that's will be apply to broker | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of the subnets for brokers | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that's will be apply to resources | `map(any)` | n/a | yes |
| <a name="input_use_aws_owned_key"></a> [use\_aws\_owned\_key](#input\_use\_aws\_owned\_key) | Use aws owned key for encryption | `bool` | `null` | no |
| <a name="input_users"></a> [users](#input\_users) | List of users, that's will be created for the access | `list(map(any))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Broker arn |
| <a name="output_console_url"></a> [console\_url](#output\_console\_url) | Broker console access url |
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | Broker connection endpoint with specific protocol |
| <a name="output_id"></a> [id](#output\_id) | Broker id |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | Broker ip address |
<!-- END_TF_DOCS -->