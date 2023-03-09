variable "cluster_name" {
  type        = string
  description = "Elasticache cluster name"
}

variable "tags" {
  type        = map(any)
  description = "Elasticache attached tags"
}

variable "cluster_parameters" {
  type = list(map(object({
    name  = string
    value = string
  })))
  description = "List of the object for engine settings"
  default     = []
}

variable "allowed_access_from_name" {
  type        = string
  description = "The name of the resource from which access will be, eg: eks-dev"
}

variable "vpc_id" {
  type        = string
  description = "VPC id for elasticache security groups"
}
variable "allowed_cidrs" {
  type        = list(string)
  description = "List of the allowed cidrs"
}

variable "apply_immediately" {
  type        = bool
  description = "Allow apply redis changes immediately"
  default     = false
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "At rest encryption enabled. It's used aws managed kms key"
  default     = true
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Allow automatically minor version upgrade"
  default     = true
}

variable "engine_version" {
  type        = string
  description = "Redis engine version"
}

variable "maintenance_window" {
  type        = string
  description = "Maintenance window time"
}

variable "node_type" {
  type        = string
  description = "Type of the cache nodes, t3.small, t4.small, m5.large, etc"
}

variable "snapshot_retention_days" {
  type        = number
  description = "Snapshot retention days"
  default     = 7
}

variable "snapshot_window" {
  type        = string
  description = "Window for create snapshots"
}

variable "subnet_group_name" {
  type        = string
  description = "Subnet group name where cluster will be placed"
}

variable "multi_az_enabled" {
  type        = bool
  description = "Enabled multi-az placement, num cached nodes must be > 1"
}

variable "num_node_groups" {
  type        = number
  description = ""
  default     = null
}

variable "replicas_per_node_group" {
  type        = number
  description = ""
  default     = null
}

variable "cluster_enabled" {
  type        = bool
  description = ""
}

variable "num_cache_clusters" {
  type        = number
  description = ""
  default     = null
}

variable "automatic_failover_enabled" {
  type        = bool
  description = ""
  default     = false
}