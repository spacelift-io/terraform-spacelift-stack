resource "spacelift_stack" "this" {
  name                 = var.name
  repository           = var.repositoryName
  branch               = var.repositoryBranch
  manage_state         = var.manageState
  description          = var.description
  terraform_version    = var.terraformVersion
  enable_local_preview = var.enableLocalPreview
  worker_pool_id       = var.workerPoolId
  administrative       = var.administrative
  autodeploy           = var.autodeploy
  project_root         = var.projectRoot
  labels               = var.labels
}

# Used to trigger the deletion of resources when a stack is destroyed
resource "spacelift_stack_destructor" "this" {
  stack_id = spacelift_stack.this.id
}

# Triggers the stack after creation
resource "spacelift_run" "this" {
  stack_id = spacelift_stack.this.id
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
  policy_id = var.attachmentPolicyIds[count.index]
  stack_id  = spacelift_stack.this.id
}

// Stack Context Attachments
# Attaches contexts to the stack
resource "spacelift_context_attachment" "this" {
  count = length(var.attachmentContextIds)
  context_id = var.attachmentContextIds[count.index]
  stack_id   = spacelift_stack.this.id
  priority   = count.index
}
