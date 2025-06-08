variable "env" {
}

variable "region" {}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "devops-assessment"
  }
}

variable "ecs_sg" {}
variable "db_sg" {}
variable "redis_sg" {}

variable "db_password" {
  sensitive = true
}
