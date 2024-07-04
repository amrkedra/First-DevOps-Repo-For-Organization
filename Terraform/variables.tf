

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

# variable "aws_access_key" {
#   type = string
#   description = "aws access key"
#   sensitive = true
# }

# variable "aws_secret_key" {
#   type = string
#   description = "aws_secret_key"
#   sensitive = true
# }

variable "aws_Region" {
  type = string
  description = "aws_Region"
}

variable "ami" {
  type        = string
  description = "the ami name"
  nullable    = false
}

variable "subnet_id" {
  type        = string
  description = "the default subnet id for aws-bahrain region"
}

variable "instance_count" {
  type    = number
}

variable "instance_type" {
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

variable "associate_public_ip_address"{
    type = bool
    description = "associate_public_ip_address"
}