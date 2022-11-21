terraform {

  required_version = "= 1.3.5"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.31.0"
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

resource "azuread_user" "test-user1-gwiktorowski" {
  user_principal_name = "test-user1-gwiktorowski@devopsmastersgmail.onmicrosoft.com"
  display_name        = "test-user1-gwiktorowski"
  mail_nickname       = "gwiktorowski"
  password            = "Wiktor5643"
}

resource "azuread_user" "test-user2-gwiktorowski" {
  user_principal_name = "test-user2-gwiktorowski@devopsmastersgmail.onmicrosoft.com"
  display_name        = "test-user2-gwiktorowski"
  mail_nickname       = "gwiktorowski"
  password            = "Wiktor5643"
}

