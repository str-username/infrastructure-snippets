variable "storage_size_min_gb" {
  type        = number
  description = ""
}

variable "storage_size_max_gb" {
  type        = number
  description = ""
}

variable "auto_major_version_upgrade" {
  type        = bool
  description = ""
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = ""
  default     = true
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = ""
  default     = true
}

variable "availability_zone" {
  type        = string
  description = ""
  default     = null
}

variable "backup_retention_days" {
  type        = number
  description = ""
  default     = 7
}

variable "backup_window" {
  type        = string
  description = ""
}

variable "db_name" {
  type        = string
  description = ""
  default     = null
}

variable "subnet_group_name" {
  type        = string
  description = ""
  default     = null
}

variable "delete_automated_backups" {
  type        = bool
  description = ""
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = ""
  default     = false
}

variable "enabled_cloudwatch_logs_export" {
  type        = bool
  description = ""
  default     = false
}

variable "replicate_source_db" {
  type        = string
  description = ""
  default     = null
}

variable "engine" {
  type        = string
  description = ""
  default     = null
}

variable "mysql_logs_export" {
  type        = list(string)
  description = ""
  default     = ["audit", "error", "general", "slowquery"]
}

variable "pgsql_logs_export" {
  type        = list(string)
  description = ""
  default     = ["postgresql", "upgrade"]
}

variable "engine_version" {
  type        = string
  description = ""
  default     = null
}

variable "skip_final_snapshot" {
  type        = bool
  description = ""
  default     = true
}

variable "cluster_name" {
  type        = string
  description = ""
  default     = null
}

variable "instance_class" {
  type        = string
  description = ""
}

variable "iops" {
  type        = number
  description = ""
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = ""
}

variable "monitoring_interval" {
  type        = number
  description = ""
  default     = 0 # todo - if set > 0 - needs role arn fix me
}

variable "multi_az_enabled" {
  type        = bool
  description = ""
  default     = false
}

variable "network_type" {
  type        = string
  description = ""
  default     = "IPV4"
}

variable "performance_insights_enabled" {
  type        = bool
  description = ""
  default     = true
}

variable "performance_insights_retention_days" {
  type        = number
  description = ""
  default     = 7
}

variable "allow_public_access" {
  type        = bool
  description = ""
  default     = false
}

variable "storage_type" {
  type        = string
  description = ""
}

variable "storage_throughput" {
  type        = number
  description = ""
  default     = null
}

variable "time_zone" {
  type        = string
  description = ""
  default     = null
}

variable "user_name" {
  type        = string
  description = ""
  default     = null
}

variable "port" {
  type        = number
  description = ""
  default     = 6432
}

variable "vpc_id" {
  type        = string
  description = ""
}

variable "allowed_cidrs" {
  type        = list(string)
  description = ""
}

variable "allowed_access_from_name" {
  type        = string
  description = ""
}

variable "security_groups" {
  type        = list(string)
  description = ""
  default     = []
}

variable "tags" {
  type        = map(string)
  description = ""
}