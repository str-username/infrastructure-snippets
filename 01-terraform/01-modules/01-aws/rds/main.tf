locals {
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_export == true ? (
    var.engine == "mysql" ? var.mysql_logs_export : (
    var.engine == "postgres" ? var.pgsql_logs_export : null)
  ) : null
}

resource "aws_security_group" "this" {
  count       = length(var.security_groups) > 0 ? 0 : 1
  description = "Allow access to rds cluster from ${var.allowed_access_from_name}"
  name        = "${var.cluster_name}-ingress-allowed"
  vpc_id      = var.vpc_id
  tags        = merge({ "Name" = "${var.cluster_name}-ingress-allowed"}, var.tags)

  ingress {
    from_port   = var.port
    protocol    = "tcp"
    to_port     = var.port
    cidr_blocks = var.allowed_cidrs
    description = "Allow rds port for all protocols"
  }
}

resource "random_password" "this" {
  count   = var.cluster_name != null ? 1 : 0
  length  = 16
  special = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_db_instance" "this" {
  allocated_storage                     = var.storage_size_min_gb
  max_allocated_storage                 = var.storage_size_max_gb
  allow_major_version_upgrade           = var.auto_major_version_upgrade
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_days
  backup_window                         = var.backup_window
  copy_tags_to_snapshot                 = true
  db_name                               = var.db_name
  db_subnet_group_name                  = var.subnet_group_name
  delete_automated_backups              = var.delete_automated_backups
  deletion_protection                   = var.deletion_protection
  replicate_source_db                   = var.replicate_source_db
  enabled_cloudwatch_logs_exports       = local.enabled_cloudwatch_logs_exports
  engine                                = var.engine
  engine_version                        = var.engine_version
  final_snapshot_identifier             = var.skip_final_snapshot == true ? null : "${var.cluster_name}-final-snapshot"
  identifier                            = var.cluster_name
  instance_class                        = var.instance_class
  iops                                  = var.iops
  maintenance_window                    = var.maintenance_window
  monitoring_interval                   = var.monitoring_interval
  multi_az                              = var.multi_az_enabled
  network_type                          = var.network_type
  password                              = var.cluster_name != null ? random_password.this.0.result : null
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_days # 7
  publicly_accessible                   = var.allow_public_access
  skip_final_snapshot                   = var.skip_final_snapshot
  storage_type                          = var.storage_type
  storage_throughput                    = var.storage_type == "gp3" ? var.storage_throughput : null
  timezone                              = var.time_zone
  username                              = var.user_name
  vpc_security_group_ids                = length(var.security_groups) > 0 ? var.security_groups : aws_security_group.this.*.id
  port                                  = var.port
  tags                                  = var.tags
}

resource "aws_secretsmanager_secret" "this" {
  count                   = var.cluster_name != null ? 1 : 0
  name                    = "${var.engine}/${var.cluster_name}-default-root"
  recovery_window_in_days = 0
  tags                    = var.tags
}

resource "aws_secretsmanager_secret_version" "this" {
  count     = var.cluster_name != null ? 1 : 0
  secret_id = aws_secretsmanager_secret.this.0.id
  secret_string = jsonencode({
    "${var.engine}-user" = var.user_name
    "${var.engine}-pass" = random_password.this.0.result
    "${var.engine}-host" = aws_db_instance.this.endpoint
  })
  depends_on = [aws_db_instance.this]
}