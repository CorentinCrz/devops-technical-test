variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Instance type"
}

variable "instance_ami" {
  type = string
  description = "Instance ami"
}

variable "instance_count" {
  type = number
  default = 1
  description = "Number instance to deploy"
}

variable "instance_key_name" {
  type = string
  description = "AWS EC2 key name"
}

variable "stage" {
  type = string
  default = "staging"
  description = "Stage in which the app is deployed"
}