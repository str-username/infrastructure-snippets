resource "aws_mq_broker" "main" {
  broker_name                = var.name
  engine_type                = "RabbitMQ"
  engine_version             = var.rabbit_version
  host_instance_type         = var.instance_type
  apply_immediately          = var.apply_immediately
  authentication_strategy    = "simple"
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  deployment_mode            = var.instance_type == "mq.t3.micro" ? "SINGLE_INSTANCE" : var.deployment_mode
  publicly_accessible        = var.public_access
  security_groups            = var.security_groups
  storage_type               = var.instance_type == "mq.t3.micro" ? null : "ebs"
  subnet_ids                 = var.subnet_ids
  tags                       = var.tags

  dynamic "user" {
    for_each = { for user in var.users : user.name => user }
    content {
      console_access = lookup(user.value, "console_access", false)
      username       = user.value.name
      password       = user.value.password
    }
  }

  encryption_options {
    kms_key_id        = var.encryption_enabled == true ? aws_kms_key.this[0].id : null
    use_aws_owned_key = false
  }

  logs {
    general = var.logs_general
  }

  maintenance_window_start_time {
    day_of_week = var.maintenance_window.day_of_week
    time_of_day = var.maintenance_window.time_of_day
    time_zone   = var.maintenance_window.time_zone
  }
}

resource "aws_kms_key" "this" {
  count                   = var.encryption_enabled == true ? 1 : 0
  description             = "KMS key for ${var.name} RabbitMQ brokers"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 14
  is_enabled              = true
  enable_key_rotation     = false
  multi_region            = false
  tags                    = var.tags
}


resource "aws_kms_alias" "this" {
  count         = var.encryption_enabled == true ? 1 : 0
  name          = "alias/rabbitmq-${var.name}-key"
  target_key_id = aws_kms_key.this[0].id
}