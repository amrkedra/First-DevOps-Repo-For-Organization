terraform {
  backend "s3" {
    bucket  = "bucket-bahrain-2"
    key     = "terraform/terraform.tfstate"
    region  = "me-south-1"
    encrypt = true
  }
}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"

#   }
# }