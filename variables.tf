variable "name" {
  type        = string
  description = "The name of the Spacelift stack to create."
}

variable "spacelift_account_name" {
  type        = string
  description = "The name of the Spacelift account you are using. (e.g. The $NAME variable of https://$NAME.app.spacelift.io)"
}

variable "repository_name" {
  type        = string
  description = "The name of the Git repository for the stack to use."
}

variable "repository_branch" {
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

variable "spacelift_aws_account_id" {
  type        = string
  description = "The ID of Spacelift's AWS account."
  default     = "324880187172"
}

variable "execution_role_policy_arns" {
  type        = list(string)
  description = "A list of ARNs of IAM Policies to apply to the IAM Role that will be used by the Spacelift stack AWS integration."
  default = [
    "arn:aws:iam::aws:policy/PowerUserAccess"
  ]
}

variable "setup_aws_integration" {
  type        = bool
  description = "Whether or not to setup the AWS integration for the Spacelift stack being created."
  default     = true
}

variable "create_iam_role" {
  type        = bool
  description = "Whether or not to create an IAM role for the stack to use for the AWS Integration. If false, stackAwsRoleArn must be specified for the AWS integration to be setup."
  default     = true
}

variable "execution_role_arn" {
  type        = string
  description = "Use this variable if you would like to specify a custom role ARN to use for your stack's AWS integration. Note: setup_aws_integration should be true & create_iam_role false when this variable is used"
  default     = ""
}

variable "attachment_policy_ids" {
  type        = list(string)
  description = "A list of policy ids to attach to the stack being created. Optional, but powerful feature of Spacelift!"
  default     = []
}

variable "attachment_context_ids" {
  type        = list(any)
  description = "A list of context ids to attach in priority order."
  default     = []
}

variable "runner_image" {
  type        = string
  description = "Name of the Docker image used to process Runs."
  default     = ""
}

variable "autoretry" {
  type        = bool
  description = "Indicates whether obsolete proposed changes should automatically be retried."
  default     = false
}

variable "before_apply" {
  type        = list(string)
  description = "List of before-apply scripts."
  default     = []
}

variable "before_destroy" {
  type        = list(string)
  description = "List of before-destroy scripts."
  default     = []
}

variable "before_init" {
  type        = list(string)
  description = "List of before-init scripts."
  default     = []
}

variable "before_perform" {
  type        = list(string)
  description = "List of before-perform scripts."
  default     = []
}

variable "before_plan" {
  type        = list(string)
  description = "List of before-plan scripts."
  default     = []
}

variable "after_apply" {
  type        = list(string)
  description = "List of after-apply scripts."
  default     = []
}

variable "after_destroy" {
  type        = list(string)
  description = "List of after-destroy scripts."
  default     = []
}

variable "after_init" {
  type        = list(string)
  description = "List of after-init scripts."
  default     = []
}

variable "after_perform" {
  type        = list(string)
  description = "List of after-perform scripts."
  default     = []
}

variable "after_plan" {
  type        = list(string)
  description = "List of after-plan scripts."
  default     = []
}
