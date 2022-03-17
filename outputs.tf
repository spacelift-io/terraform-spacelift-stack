# Conditional Output: Stack AWS Execution Role Arn
# This value is null if the create_iam_role bool is false
output "roleArn" {
  value = var.create_iam_role ? aws_iam_role.this[0].arn : null
}

# The id of the created stack
output "id" {
  value = spacelift_stack.this.id
}
