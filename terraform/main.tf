
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.4.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

# Add a user to the organization
resource "github_membership" "membership_threehook" {
  username = "threehook"
}

# provider "kubernetes" {
#   config_path = var.kube_config
#
#   experiments {
#     manifest_resource = true
#   }
# }
#
# provider "helm" {
#   kubernetes {
#     config_path = var.kube_config
#   }
# }

provider "azurerm" {
  features {}
  subscription_id = "a6ce566c-53c3-4548-ac59-63c982e8ab78"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-cicd-apps"
  location = local.location
}

locals {
  env      = var.environment
  location = "West Europe"
}
