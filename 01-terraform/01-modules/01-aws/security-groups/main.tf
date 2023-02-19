resource "aws_security_group" "main" {
  for_each    = var.settings
  name        = each.value.name
  description = lookup(each.value, "description", null)
  vpc_id      = each.value.vpc_id
  tags        = lookup(each.value, "tags", {})

  dynamic "ingress" {
    for_each = lookup(each.value, "ingress", {})
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
    }
  }

  dynamic "egress" {
    for_each = lookup(each.value, "egress", {})
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
    }
  }
}