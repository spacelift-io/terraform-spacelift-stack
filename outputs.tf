# Conditional Output: Stack AWS Execution Role Arn
# This value is null if the createIamRole bool is false
output "roleArn" {
    value = var.createIamRole ? aws_iam_role.this.arn : null
}
