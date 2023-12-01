terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.83.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.28.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }

  
   
  }
}
