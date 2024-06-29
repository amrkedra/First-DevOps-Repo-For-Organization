variable "ami" {
  type        = string
  description = "the ami name"
  nullable    = false

}

variable "vpc_security_group_ids" {
  type        = string
  description = "the default VPC for AWS"
}

variable "subnet_id" {
  type        = string
  description = "the default subnet id for aws-bahrain region"

}

variable "instatnce_type" {
  default     = "t3.micro"
  description = "the default type of instances, if not available choose t3.micro"

}
# variable "names" {
#   type    = list(string)
# }


variable "cou_inst" {
  type    = number

}

variable "env" {
  type    = list(string)
  description = "the working env"
}

variable "azure_client_id" {
  description = "azure username"
  type = string
  sensitive = false
}

variable "azure_client_secret" {
  type = string
  description = "azure password"
  sensitive = true
}

variable "azure_subscription_id" {
  type = string
  description = "azure subscription id"
  sensitive = false
}

variable "azure_tenant_id" {
  type = string
  description = "azure tenant id"
  sensitive = false
}

variable "azure_region" {
  type = string
  description = "region of azure resource"
}

variable "aws_access_key" {
  type = string
  description = "aws access key"
  sensitive = true
}

variable "aws_secret_key" {
  type = string
  description = "aws_secret_key"
  sensitive = true
}

variable "aws_Region" {
  type = string
  description = "aws_Region"
}