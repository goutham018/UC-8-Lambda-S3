variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to be triggered by the S3 bucket"
  type        = string
}
# filepath: /workspaces/AssistedProjects/use-case/UC-8-Lambda-S3/modules/s3/variables.tf
variable "lambda_permission_id" {
  description = "ID of the Lambda permission resource"
}