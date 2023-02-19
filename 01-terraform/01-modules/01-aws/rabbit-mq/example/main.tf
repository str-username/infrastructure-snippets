module "rabbit_mq" {
  source                     = "../../rabbit-mq"
  name                       = "rabbit-mq-example"
  rabbit_version             = "3.10.10"
  instance_type              = "mq.t3.micro"
  apply_immediately          = true
  auto_minor_version_upgrade = true
  deployment_mode            = "SINGLE_INSTANCE"
  public_access              = true
  logs_general               = true
  security_groups            = []
  subnet_ids                 = []
  users = [
    {
      name     = "default"
      password = "BadPracticePassword1"
    }
  ]
  maintenance_window = {
    day_of_week = "SUNDAY"
    time_of_day = "12:00"
    time_zone   = "CET"
  }
  tags = {
    Billing     = "dev"
    Terraform   = true
    Environment = "dev"
  }
}