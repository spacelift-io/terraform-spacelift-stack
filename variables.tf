variable "name" {
  type        = string
  description = "The name of the Spacelift stack to create."
}

variable "spaceliftAccountName" {
  type        = string
  description = "The name of the Spacelift account you are using. (e.g. The $NAME variable of https://$NAME.app.spacelift.io)"
}

variable "repositoryName" {
  type        = string
  description = "The name of the Git repository for the stack to use."
}

variable "repositoryBranch" {
  type        = string
  description = "The name of the branch to use for the specified Git repository."
}

variable "manage_state" {
  type        = bool
  description = "Whether or not you would like Spacelift to manage the state for your stack."
  default     = true
}

variable "description" {
  type        = string
  description = "A description to describe your Spacelift stack."
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform for your stack to use. Defaults to latest."
  default     = ""
}

variable "enable_local_preview" {
  type        = bool
  description = "Whether or not to enable the Spacelift CLI 'local preview' feature"
  default     = false
}

variable "worker_pool_id" {
  type        = string
  description = "The ID of the worker pool to use for Spacelift stack runs."
  default     = ""
}

variable "administrative" {
  type        = bool
  description = "Whether or not the stack created should be administrative (able to manage Spacelift resources)."
  default     = false
}

variable "autodeploy" {
  type        = bool
  description = "Whether or not the Spacelift stack created should autodeploy resources without approval."
  default     = false
}

variable "project_root" {
  type        = string
  description = "The path to your project root in your repository to use as the root of the stack. Defaults to root of the repository."
  default     = ""
}

variable "labels" {
  type        = list(string)
  description = "Labels to apply to the stack being created."
  default     = []
}

variable "spaceliftAwsAccountId" {
  type        = string
  description = "The ID of Spacelift's AWS account."
  default     = "324880187172"
}

variable "executionRolePolicyArns" {
  type        = list(string)
  description = "A list of ARNs of IAM Policies to apply to the IAM Role that will be used by the Spacelift stack AWS integration."
  default = [
    "arn:aws:iam::aws:policy/PowerUserAccess"
  ]
}

variable "setupAwsIntegration" {
  type        = bool
  description = "Whether or not to setup the AWS integration for the Spacelift stack being created."
  default     = true
}

variable "createIamRole" {
  type        = bool
  description = "Whether or not to create an IAM role for the stack to use for the AWS Integration. If false, stackAwsRoleArn must be specified for the AWS integration to be setup."
  default     = true
}

variable "executionRoleArn" {
  type        = string
  description = "Use this variable if you would like to specify a custom role ARN to use for your stack's AWS integration. Note: setupAwsIntegration should be true & createIamRole false when this variable is used"
  default     = ""
}

variable "attachmentPolicyIds" {
  type        = list(string)
  description = "A list of policy ids to attach to the stack being created. Optional, but powerful feature of Spacelift!"
  default     = []
}
