terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 0.1.11"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Basic Usage Example
# Update input values according to your needs
provider "spacelift" {
  api_key_endpoint = "https://my-spacelift.app.spacelift.io"
  api_key_id       = "your-spacelift-api-key-id"
  api_key_secret   = "your-spacelift-api-key-secret"
}

provider "aws" {
  region  = "us-east-1"
}

# Note: the "stack" module has other non-required inputs that can be customized
# see the "variables.tf" file or USAGE.md for more information.
module "stack" {
  source = "../../"

  name                 = "example-stack"
  spacelift_account_name = "my-spacelift"
  repository_name       = "your-stack-repo"
  repository_branch     = "main"
  description          = "This is an example stack."
}
