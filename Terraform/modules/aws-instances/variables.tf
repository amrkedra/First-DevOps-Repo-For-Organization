variable "ami" {
  type        = string
  description = "the ami name"
  nullable    = false
}

variable "subnet_id" {
  type        = string
  description = "the default subnet id for aws-bahrain region"
}

variable "cou_inst" {
  type    = number
}

variable "instatnce_type" {
  type = string
  description = "the default type of instances, if not available choose t3.micro"

}

variable "key_name" {
  type = string
  description = "the key pair for ec2 instances of bahrain"
  sensitive = true
}

variable "env" {
  type    = list(string)
  description = "the working env"
}