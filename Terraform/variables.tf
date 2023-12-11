variable "ami" {
    type = string
    description = "the ami name"
    default = "ami-0f8d2a6080634ee69"
    nullable = false

}

variable "vpc_security_group_ids" {
    type = string
    description = "the default VPC for AWS"
    default = "vpc-0da89eaf3a2bcb548"
}

variable "subnet_id" {
    type = string
    description = "the default subnet id for aws-bahrain region"
    default = "subnet-028e2eb09b7de9c6a"
  
}

variable "instatnce_type" {
    default = "t2.micro"
    description = "the default type of instances, if not available choose t3.micro"
    validation {
      condition = var.instatnce_type == "t2.micro"
      error_message = "if t2.micro not available choose t3.micro "
    }
}

variable "log_data" {
    description = "enter value"
    type = string
}

resource "local_file" "log_file" {
    content = var.log_data
    filename = "logfile"
  
}


variable "password" {
      description = "password for my instances"
      sensitive = true
      default = "2193"
}

variable "number" {
    type = number
    default = 3
}

variable "list" {
    type = list(string)
    default = ["hello" , "world"]
}

variable "map" {
    type = map(number)
    default = {
      "count" = 23
    }
}

variable "set" {
    type = set(string)
    default = [ "helllo","this","is" ]
}

variable "tuple" {
    type = tuple([ string, number,string ])
    default = [ "server-1", 4, "Dev" ]
}

variable "object" {
    type = object({
      name = string
      count = number
      env = string 
    })

    default = {
      name = "server1"
      count = 5
      env = "QA"
    }
}