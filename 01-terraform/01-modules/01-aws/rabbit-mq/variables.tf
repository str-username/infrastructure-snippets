variable "name" {
  type        = string
  description = "RabbitMQ broker name"
}

variable "rabbit_version" {
  type        = string
  description = "RabbitMQ broker engine version"
}

variable "instance_type" {
  type        = string
  description = "RabbitMQ instance size, only mq.m5 classes supported"
}

variable "apply_immediately" {
  type        = bool
  description = "Apply mq changes immediately"
  default     = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Upgrade minor version automatically"
  default     = false
}

variable "deployment_mode" {
  type        = string
  description = "Deployment mode of the broker, if instance type not mq.t3.micro"
  default     = "SINGLE_INSTANCE"
}

variable "public_access" {
  type        = bool
  description = "Publish RabbitMQ to public"
  default     = false
}

variable "security_groups" {
  type        = list(string)
  description = "List of the security groups that's will be apply to broker"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of the subnets for brokers"
}

variable "tags" {
  type        = map(any)
  description = "Tags that's will be apply to resources"
}

variable "users" {
  type        = list(map(any))
  description = "List of users, that's will be created for the access"
}

variable "kms_key_id" {
  type        = string
  description = "KMS key id that's will be used for encryption"
  default     = null
}

variable "logs_general" {
  type        = bool
  description = "Enabled general logs"
  default     = false
}

variable "maintenance_window" {
  type = object({
    day_of_week = string
    time_of_day = string
    time_zone   = string
  })
  description = "Maintenance parameters"
  default = {
    day_of_week = "MONDAY"
    time_of_day = "00:00"
    time_zone   = "CET"
  }
}

variable "encryption_enabled" {
  type        = bool
  description = "Enabled self managed kms key encryption"
  default     = false
}