locals {
  num_node_groups         = var.num_node_groups != null ? var.num_node_groups : null
  num_cache_clusters      = var.num_cache_clusters != null ? var.num_cache_clusters : null
  replicas_per_node_group = var.replicas_per_node_group != null ? var.replicas_per_node_group : null
}

resource "aws_elasticache_parameter_group" "this" {
  name        = "${var.cluster_name}-parameter-group"
  family      = format("%s%s", "redis", regex("^[^.]*", var.engine_version))
  description = "Parameter group for ${var.cluster_name} cluster"
  tags        = var.tags

  dynamic "parameter" {
    for_each = { for parameter in var.cluster_parameters : parameter.name => parameter }
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  dynamic "parameter" {
    for_each = var.cluster_enabled == true ? [1] : []
    content {
      name  = "cluster-enabled"
      value = "yes"
    }
  }
}

resource "aws_security_group" "this" {
  description = "Allow access to elasticace cluster from ${var.allowed_access_from_name}"
  name        = "${var.cluster_name}-ingress-allowed"
  vpc_id      = var.vpc_id
  tags        = merge({ "Name" = "${var.cluster_name}-ingress-allowed"}, var.tags)

  ingress {
    from_port   = 6432
    protocol    = "tcp"
    to_port     = 6432
    cidr_blocks = var.allowed_cidrs
    description = "Allow elasticache port for all protocols"
  }
}

resource "aws_elasticache_replication_group" "this" {
  description                = "Elasticache replication group for ${var.cluster_name} cache"
  replication_group_id       = var.cluster_name
  apply_immediately          = var.apply_immediately
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  automatic_failover_enabled = var.automatic_failover_enabled
  engine                     = "redis"
  engine_version             = var.engine_version
  maintenance_window         = var.maintenance_window
  multi_az_enabled           = var.multi_az_enabled
  node_type                  = var.node_type
  num_node_groups            = local.num_node_groups
  replicas_per_node_group    = local.replicas_per_node_group
  num_cache_clusters         = local.num_cache_clusters
  parameter_group_name       = aws_elasticache_parameter_group.this.name
  port                       = 6379
  security_group_ids         = [aws_security_group.this.id]
  snapshot_retention_limit   = var.snapshot_retention_days
  snapshot_window            = var.snapshot_window
  subnet_group_name          = var.subnet_group_name
  tags                       = var.tags
}