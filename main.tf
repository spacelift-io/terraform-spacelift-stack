resource "spacelift_stack" "this" {
  name                 = var.name
  repository           = var.repository_name
  branch               = var.repository_branch
  manage_state         = var.manage_state
  description          = var.description
  terraform_version    = var.terraform_version
  enable_local_preview = var.enable_local_preview
  worker_pool_id       = var.worker_pool_id
  administrative       = var.administrative
  autodeploy           = var.autodeploy
  project_root         = var.project_root
  labels               = var.labels
  runner_image         = var.runner_image
  autoretry            = var.autoretry
  before_apply         = var.before_apply
  before_destroy       = var.before_destroy
  before_init          = var.before_init
  before_perform       = var.before_perform
  before_plan          = var.before_plan
  after_apply          = var.after_apply
  after_destroy        = var.after_destroy
  after_init           = var.after_init
  after_perform        = var.after_perform
  after_plan           = var.after_plan

  dynamic "github_enterprise" {
    for_each = var.github_organization == null ? [] : [true]
    content {
      namespace = var.github_organization
    }
  }
}

# Used to trigger the deletion of resources when a stack is destroyed
resource "spacelift_stack_destructor" "this" {
  depends_on = [
    spacelift_stack.this,
    spacelift_context_attachment.this,
    spacelift_policy_attachment.this
  ]
  stack_id = spacelift_stack.this.id
}

# Triggers the stack after creation
resource "spacelift_run" "this" {
  stack_id = spacelift_stack.this.id
}

// IAM Role to allow stacks to deploy resources on AWS
resource "aws_iam_role" "this" {
  count               = var.create_iam_role ? 1 : 0
  name                = "${var.spacelift_account_name}-${var.name}"
  managed_policy_arns = var.execution_role_policy_arns
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : "${var.spacelift_account_name}@${var.name}"
          }
        },
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "${var.spacelift_aws_account_id}"
        }
      }
    ]
  })
}

// Stack Role Attachment
# Sets up the AWS Integration on the stack
resource "spacelift_aws_role" "this" {
  count = var.setup_aws_integration ? 1 : 0
  depends_on = [
    spacelift_stack.this
  ]
  stack_id = spacelift_stack.this.id
  role_arn = var.create_iam_role ? aws_iam_role.this[0].arn : var.execution_role_arn
}

// Stack Policy Attachments
# Attaches policies to the stack
resource "spacelift_policy_attachment" "this" {
  count = length(var.attachment_policy_ids)
  policy_id = var.attachment_policy_ids[count.index]
  stack_id  = spacelift_stack.this.id
}

// Stack Context Attachments
# Attaches contexts to the stack
resource "spacelift_context_attachment" "this" {
  count = length(var.attachment_context_ids)
  context_id = var.attachment_context_ids[count.index]
  stack_id   = spacelift_stack.this.id
  priority   = count.index
}
