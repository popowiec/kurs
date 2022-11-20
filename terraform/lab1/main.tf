terraform {

  required_version = "= 1.3.5"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.31.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }

    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.8.0-beta.1"
    }

    azuread = {
      source = "hashicorp/azuread"
      version = "2.30.0"
    }    
  }

}

provider "azurerm" {
  # Configuration options
    features{}
}

provider "azuread" {
  # Configuration options
}

resource "azuread_user" "example" {
  user_principal_name = "test-user-gwiktorowski@devopsmastersgmail.onmicrosoft.com"
  display_name        = "test-user-gwiktorowski"
  mail_nickname       = "gwiktorowski"
  password            = "Wiktor5643"
}