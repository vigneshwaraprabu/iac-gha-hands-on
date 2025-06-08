variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "cluster_id" {
  type = string
}

variable "service_name" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "cpu" {
  type    = string
  default = "256"
}

variable "memory" {
  type    = string
  default = "512"
}

variable "container_port" {
  type    = number
  default = 80
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "max_capacity" {
  type    = number
  default = 3
}

variable "cpu_target_value" {
  type    = number
  default = 50
}

variable "enable_custom_metric_policy" {
  type    = bool
  default = false
}

variable "custom_metric_name" {
  type    = string
  default = ""
}

variable "custom_metric_namespace" {
  type    = string
  default = ""
}

variable "custom_metric_statistic" {
  type    = string
  default = "Average"
}

variable "custom_metric_dimensions" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "custom_metric_target_value" {
  type    = number
  default = 0
}
