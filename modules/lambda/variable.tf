variable "s3_bucket" {
  description = "The name of the source S3 bucket"
}

variable "destination_bucket" {
  description = "The name of the destination S3 bucket"
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for Lambda execution"
}
