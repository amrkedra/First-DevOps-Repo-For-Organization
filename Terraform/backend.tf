terraform {
  backend "s3" {
    bucket = "bucket-bahrain-1"
    key    = "terraform/terraform.tfstate"
    region = "me-south-1"
    encrypt = true
  }
}
