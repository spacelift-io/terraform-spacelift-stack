resource "spacelift_stack" "this" {
  name                 = var.name
  repository           = var.repositoryName
  branch               = var.repositoryBranch
  manage_state         = var.manage_state
  description          = var.description
  terraform_version    = var.terraform_version
  enable_local_preview = var.enable_local_preview
  worker_pool_id       = var.worker_pool_id
  administrative       = var.administrative
  autodeploy           = var.autodeploy
  project_root         = var.project_root
  labels               = var.labels
}

// IAM Role to allow stacks to deploy resources on AWS
resource "aws_iam_role" "this" {
  count               = var.createIamRole ? 1 : 0
  name                = "${var.spaceliftAccountName}-${var.name}"
  managed_policy_arns = var.executionRolePolicyArns
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : "${var.spaceliftAccountName}@${var.name}"
          }
        },
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "${var.spaceliftAwsAccountId}"
        }
      }
    ]
  })
}

// Stack Role Attachment
# Sets up the AWS Integration on the stack
resource "spacelift_aws_role" "this" {
  count = var.setupAwsIntegration ? 1 : 0
  depends_on = [
    spacelift_stack.this
  ]
  stack_id = spacelift_stack.this.id
  role_arn = var.createIamRole ? aws_iam_role.this[0].arn : var.executionRoleArn
}

// Stack Policy Attachments
# Attaches policies to the stack
resource "spacelift_policy_attachment" "this" {
  count = length(var.attachmentPolicyIds)
  depends_on = [
    spacelift_stack.this
  ]
  policy_id = var.attachmentPolicyIds[count.index]
  stack_id  = spacelift_stack.this.id
}

// Stack Context Attachments
# Attaches contexts to the stack
resource "spacelift_context_attachment" "this" {
  count = length(var.attachmentContextIds)
  depends_on = [
    spacelift_stack.this
  ]
  context_id = var.attachmentContextIds[count.index]
  stack_id   = spacelift_stack.this.id
  priority   = count.index
}
