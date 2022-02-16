<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |
| <a name="provider_spacelift"></a> [spacelift](#provider\_spacelift) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [spacelift_aws_role.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/aws_role) | resource |
| [spacelift_policy_attachment.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/policy_attachment) | resource |
| [spacelift_stack.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrative"></a> [administrative](#input\_administrative) | Whether or not the stack created should be administrative (able to manage Spacelift resources). | `bool` | `false` | no |
| <a name="input_attachmentPolicyIds"></a> [attachmentPolicyIds](#input\_attachmentPolicyIds) | A list of policy ids to attach to the stack being created. Optional, but powerful feature of Spacelift! | `list(string)` | `[]` | no |
| <a name="input_autodeploy"></a> [autodeploy](#input\_autodeploy) | Whether or not the Spacelift stack created should autodeploy resources without approval. | `bool` | `false` | no |
| <a name="input_createIamRole"></a> [createIamRole](#input\_createIamRole) | Whether or not to create an IAM role for the stack to use for the AWS Integration. If false, stackAwsRoleArn must be specified for the AWS integration to be setup. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | A description to describe your Spacelift stack. | `string` | n/a | yes |
| <a name="input_enable_local_preview"></a> [enable\_local\_preview](#input\_enable\_local\_preview) | Whether or not to enable the Spacelift CLI 'local preview' feature | `bool` | `false` | no |
| <a name="input_executionRoleArn"></a> [executionRoleArn](#input\_executionRoleArn) | Use this variable if you would like to specify a custom role ARN to use for your stack's AWS integration. Note: setupAwsIntegration should be true & createIamRole false when this variable is used | `string` | `""` | no |
| <a name="input_executionRolePolicyArns"></a> [executionRolePolicyArns](#input\_executionRolePolicyArns) | A list of ARNs of IAM Policies to apply to the IAM Role that will be used by the Spacelift stack AWS integration. | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/PowerUserAccess"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the stack being created. | `list(string)` | `[]` | no |
| <a name="input_manage_state"></a> [manage\_state](#input\_manage\_state) | Whether or not you would like Spacelift to manage the state for your stack. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Spacelift stack to create. | `string` | n/a | yes |
| <a name="input_project_root"></a> [project\_root](#input\_project\_root) | The path to your project root in your repository to use as the root of the stack. Defaults to root of the repository. | `string` | `""` | no |
| <a name="input_repositoryBranch"></a> [repositoryBranch](#input\_repositoryBranch) | The name of the branch to use for the specified Git repository. | `string` | n/a | yes |
| <a name="input_repositoryName"></a> [repositoryName](#input\_repositoryName) | The name of the Git repository for the stack to use. | `string` | n/a | yes |
| <a name="input_setupAwsIntegration"></a> [setupAwsIntegration](#input\_setupAwsIntegration) | Whether or not to setup the AWS integration for the Spacelift stack being created. | `bool` | `true` | no |
| <a name="input_spaceliftAccountName"></a> [spaceliftAccountName](#input\_spaceliftAccountName) | The name of the Spacelift account you are using. (e.g. The $NAME variable of https://$NAME.app.spacelift.io) | `string` | n/a | yes |
| <a name="input_spaceliftAwsAccountId"></a> [spaceliftAwsAccountId](#input\_spaceliftAwsAccountId) | The ID of Spacelift's AWS account. | `string` | `"324880187172"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform for your stack to use. Defaults to latest. | `string` | `""` | no |
| <a name="input_worker_pool_id"></a> [worker\_pool\_id](#input\_worker\_pool\_id) | The ID of the worker pool to use for Spacelift stack runs. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roleArn"></a> [roleArn](#output\_roleArn) | Conditional Output: Stack AWS Execution Role Arn This value is null if the createIamRole bool is false |
<!-- END_TF_DOCS -->