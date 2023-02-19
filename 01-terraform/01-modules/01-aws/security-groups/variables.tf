variable "settings" {
  default = {
    my_security_group_1 = {
      name        = "sg-name-1"
      description = "sg allowed all ports"
      vpc_id      = "vpc-123456"

      tags = {
        Tag1 = "value1"
        Tag2 = "value2"
      }

      ingress = [
        # first rule
        {
          from_port        = "22"
          to_port          = "22"
          protocol         = "TCP"
          cidr_blocks      = ["1.1.1.1/32", "2.2.2.2/32"]
          ipv6_cidr_blocks = ["2001:db8::/128", "2001:db8::/119"]
        },
        # second rule {...}
      ]
    }
  }
  description = "List of parameters for created security groups"
}