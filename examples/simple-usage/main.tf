terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}

module "stack" {
  source = "../../"

  name = "example-stack"
  repositoryName = "example-repoName"
  repositoryBranch = "main"
  description = "This is an example stack."
}
