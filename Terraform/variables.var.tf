variable "ami" {
  type        = string
  description = "the ami name"
  default     = "ami-0f8d2a6080634ee69"
  nullable    = false

}

variable "vpc_security_group_ids" {
  type        = string
  description = "the default VPC for AWS"
  default     = "sg-008bf23ce5571e4c5"
}

variable "subnet_id" {
  type        = string
  description = "the default subnet id for aws-bahrain region"
  default     = "subnet-028e2eb09b7de9c6a"

}

variable "instatnce_type" {
  default     = "t3.micro"
  description = "the default type of instances, if not available choose t3.micro"

}
variable "names" {
  type    = list(string)
  default = ["Jenkins-Server-Master", "Jenkins-Worker-Node "]
}

# variable "log_data" {
#   description = "enter value"
#   type        = string
# }

# resource "local_file" "log_file" {
#   content  = var.log_data
#   filename = "logfile"

# }


# variable "password" {
#   description = "password for my instances"
#   sensitive   = true
#   default     = "2193"
# }

# variable "number" {
#   type    = number
#   default = 3
# }

# variable "list" {
#   type    = list(string)
#   default = ["hello", "world"]
# }

# variable "map" {
#   type = map(number)
#   default = {
#     "count" = 23
#   }
# }

# variable "set" {
#   type    = set(string)
#   default = ["helllo", "this", "is"]
# }

# variable "tuple" {
#   type    = tuple([string, number, string])
#   default = ["server-1", 4, "Dev"]
# }

# variable "object" {
#   type = object({

#     name  = string
#     count = number
#     env   = string
#   })

#   default = {
#     name  = "server1"
#     count = 5
#     env   = "QA"
#   }
# }

variable "cou_inst" {
  type    = number
  default = 4

}

variable "env" {
  type    = list(string)
  default = ["Dev", "QA", "prod"]
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
  default = "UAE North"
}