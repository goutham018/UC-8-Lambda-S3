variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "s3_bucket" {
  description = "The name of the source S3 bucket"
  type        = string
  default     = "source-images-bucket-273550"
}

variable "destination_bucket" {
  description = "The name of the destination S3 bucket"
  type        = string
  default     = "processed-images-bucket-273550"
}