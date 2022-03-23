<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_spacelift"></a> [spacelift](#requirement\_spacelift) | ~> 0.1.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_spacelift"></a> [spacelift](#provider\_spacelift) | ~> 0.1.11 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [spacelift_aws_role.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/aws_role) | resource |
| [spacelift_context_attachment.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/context_attachment) | resource |
| [spacelift_policy_attachment.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/policy_attachment) | resource |
| [spacelift_run.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/run) | resource |
| [spacelift_stack.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/stack) | resource |
| [spacelift_stack_destructor.this](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/stack_destructor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrative"></a> [administrative](#input\_administrative) | Whether or not the stack created should be administrative (able to manage Spacelift resources). | `bool` | `false` | no |
| <a name="input_after_apply"></a> [after\_apply](#input\_after\_apply) | List of after-apply scripts. | `list(string)` | `[]` | no |
| <a name="input_after_destroy"></a> [after\_destroy](#input\_after\_destroy) | List of after-destroy scripts. | `list(string)` | `[]` | no |
| <a name="input_after_init"></a> [after\_init](#input\_after\_init) | List of after-init scripts. | `list(string)` | `[]` | no |
| <a name="input_after_perform"></a> [after\_perform](#input\_after\_perform) | List of after-perform scripts. | `list(string)` | `[]` | no |
| <a name="input_after_plan"></a> [after\_plan](#input\_after\_plan) | List of after-plan scripts. | `list(string)` | `[]` | no |
| <a name="input_attachment_context_ids"></a> [attachment\_context\_ids](#input\_attachment\_context\_ids) | A list of context ids to attach in priority order. | `list(any)` | `[]` | no |
| <a name="input_attachment_policy_ids"></a> [attachment\_policy\_ids](#input\_attachment\_policy\_ids) | A list of policy ids to attach to the stack being created. Optional, but powerful feature of Spacelift! | `list(string)` | `[]` | no |
| <a name="input_autodeploy"></a> [autodeploy](#input\_autodeploy) | Whether or not the Spacelift stack created should autodeploy resources without approval. | `bool` | `false` | no |
| <a name="input_autoretry"></a> [autoretry](#input\_autoretry) | Indicates whether obsolete proposed changes should automatically be retried. | `bool` | `false` | no |
| <a name="input_before_apply"></a> [before\_apply](#input\_before\_apply) | List of before-apply scripts. | `list(string)` | `[]` | no |
| <a name="input_before_destroy"></a> [before\_destroy](#input\_before\_destroy) | List of before-destroy scripts. | `list(string)` | `[]` | no |
| <a name="input_before_init"></a> [before\_init](#input\_before\_init) | List of before-init scripts. | `list(string)` | `[]` | no |
| <a name="input_before_perform"></a> [before\_perform](#input\_before\_perform) | List of before-perform scripts. | `list(string)` | `[]` | no |
| <a name="input_before_plan"></a> [before\_plan](#input\_before\_plan) | List of before-plan scripts. | `list(string)` | `[]` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Whether or not to create an IAM role for the stack to use for the AWS Integration. If false, stackAwsRoleArn must be specified for the AWS integration to be setup. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | A description to describe your Spacelift stack. | `string` | n/a | yes |
| <a name="input_enable_local_preview"></a> [enable\_local\_preview](#input\_enable\_local\_preview) | Whether or not to enable the Spacelift CLI 'local preview' feature | `bool` | `false` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | Use this variable if you would like to specify a custom role ARN to use for your stack's AWS integration. Note: setup\_aws\_integration should be true & create\_iam\_role false when this variable is used | `string` | `""` | no |
| <a name="input_execution_role_policy_arns"></a> [execution\_role\_policy\_arns](#input\_execution\_role\_policy\_arns) | A list of ARNs of IAM Policies to apply to the IAM Role that will be used by the Spacelift stack AWS integration. | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/PowerUserAccess"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the stack being created. | `list(string)` | `[]` | no |
| <a name="input_manage_state"></a> [manage\_state](#input\_manage\_state) | Whether or not you would like Spacelift to manage the state for your stack. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Spacelift stack to create. | `string` | n/a | yes |
| <a name="input_project_root"></a> [project\_root](#input\_project\_root) | The path to your project root in your repository to use as the root of the stack. Defaults to root of the repository. | `string` | `""` | no |
| <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch) | The name of the branch to use for the specified Git repository. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the Git repository for the stack to use. | `string` | n/a | yes |
| <a name="input_runner_image"></a> [runner\_image](#input\_runner\_image) | Name of the Docker image used to process Runs. | `string` | `""` | no |
| <a name="input_setup_aws_integration"></a> [setup\_aws\_integration](#input\_setup\_aws\_integration) | Whether or not to setup the AWS integration for the Spacelift stack being created. | `bool` | `true` | no |
| <a name="input_spacelift_account_name"></a> [spacelift\_account\_name](#input\_spacelift\_account\_name) | The name of the Spacelift account you are using. (e.g. The $NAME variable of https://$NAME.app.spacelift.io) | `string` | n/a | yes |
| <a name="input_spacelift_aws_account_id"></a> [spacelift\_aws\_account\_id](#input\_spacelift\_aws\_account\_id) | The ID of Spacelift's AWS account. | `string` | `"324880187172"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform for your stack to use. Defaults to latest. | `string` | `""` | no |
| <a name="input_worker_pool_id"></a> [worker\_pool\_id](#input\_worker\_pool\_id) | The ID of the worker pool to use for Spacelift stack runs. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the created stack |
| <a name="output_roleArn"></a> [roleArn](#output\_roleArn) | Conditional Output: Stack AWS Execution Role Arn This value is null if the create\_iam\_role bool is false |
<!-- END_TF_DOCS -->