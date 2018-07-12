variable "location" {
  default = "West US 2"
}

variable "service_name" {
  default = "app"
}

variable "service_version" {
  default = "1.0.0"
}

variable "env" {
  default = "staging"
}

variable "disk_size" {
  default = 1024
}

variable "system_user" {
  default = "admin"
}

variable "system_password" {
  default = "admin"
}

variable "resource_group" {}
variable "subnet" {}

variable "instance_size" {
  default = "Standard_DS1_v2"
}

variable "network_name" {
  type = "string"
}

variable "user_data" {
  type        = "string"
  description = "Instance User Data"
}
