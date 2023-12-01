terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.28.0"
    }

    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
  required_version = "1.6.5"
}

provider "aws" {

  region     = "me-south-1"
  access_key = "AKIA2TSBJY223SE3ODZO"
  secret_key = "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"
}


provider "azurerm" {
  features {}
  subscription_id = "964dd86e-90a5-4013-ac5a-0f3629695d4d"
  client_id       = "fc1a84b1-452e-4a54-96aa-69f53e6b4466"
  client_secret   = "7798ab38-203b-4a4b-9923-058279f2be01"
  tenant_id       = "0d1c2201-0ac8-4e58-a543-2f7fca8a8ec2"
}