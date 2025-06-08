variable "name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "node_type" {
  default = "cache.t4g.micro"
}
variable "tags" {
  type    = map(string)
  default = {}
}
