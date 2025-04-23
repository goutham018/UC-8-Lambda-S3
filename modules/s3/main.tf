resource "aws_s3_bucket" "source_bucket" {
  bucket = "source-images-bucket-273550"
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = "processed-images-bucket-273550"
}

# filepath: /workspaces/AssistedProjects/use-case/UC-8-Lambda-S3/modules/s3/main.tf
resource "aws_s3_bucket_notification" "source_bucket_notification" {
  bucket = aws_s3_bucket.source_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    var.lambda_permission_id
  ]
}

output "source_bucket_name" {
  value = aws_s3_bucket.source_bucket.bucket
}

output "destination_bucket_name" {
  value = aws_s3_bucket.destination_bucket.bucket
}
