terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.109.0"
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

    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }


    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
  tenant_id = var.azure_tenant_id
  client_id = var.azure_client_id
  client_secret = var.azure_client_secret
}

