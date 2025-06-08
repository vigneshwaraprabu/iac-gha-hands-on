variable "name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "instance_class" {
  default = "db.t3.medium"
}
variable "allocated_storage" {
  default = 20
}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "tags" {
  type    = map(string)
  default = {}
}
