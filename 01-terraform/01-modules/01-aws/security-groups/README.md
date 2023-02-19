<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_settings"></a> [settings](#input\_settings) | List of parameters for created security groups | `map` | <pre>{<br>  "my_security_group_1": {<br>    "description": "sg allowed all ports",<br>    "ingress": [<br>      {<br>        "cidr_blocks": [<br>          "1.1.1.1/32",<br>          "2.2.2.2/32"<br>        ],<br>        "from_port": "22",<br>        "ipv6_cidr_blocks": [<br>          "2001:db8::/128",<br>          "2001:db8::/119"<br>        ],<br>        "protocol": "TCP",<br>        "to_port": "22"<br>      }<br>    ],<br>    "name": "sg-name-1",<br>    "tags": {<br>      "Tag1": "value1",<br>      "Tag2": "value2"<br>    },<br>    "vpc_id": "vpc-123456"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | n/a |
<!-- END_TF_DOCS -->