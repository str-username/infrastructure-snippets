variable "vpc" {
  description = "Vpc network settings"
  type = object({
    name        = string
    description = optional(string, null)
    folder_id   = string
  })
}

variable "subnets" {
  description = "Subnets settings"
  type = map(object({
    v4_cidr_blocks = list(string)
    zone           = string
    name           = string
    description    = optional(string)
    dhcp_options   = optional(map(any), {})
  }))
}

variable "labels" {
  description = "Global labes that's add to vpc, subnets, rt, gw"
  type        = map(any)
  default     = {}
}