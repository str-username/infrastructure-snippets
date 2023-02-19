module "security_group" {
  source = "../../security-groups"
  settings = {
    allow_ssh_access = {
      name        = "sg-allow-ssh-access"
      description = "Allowed access via ssh"
      vpc_id      = "vpc-123456"

      ingress = [
        {
          from_port  = 22
          to_port    = 22
          protocol   = "tcp"
          cidr_block = ["0.0.0.0/0"]
        }
      ]
    }

    allow_all_outbound = {
      name        = "sg-allow-all-outbound"
      description = "Allowed all outbound traffic"
      vpc_id      = "vpc-123456"

      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}