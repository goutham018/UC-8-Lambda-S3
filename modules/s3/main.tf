resource "aws_s3_bucket" "source_bucket" {
  bucket = "source-images-bucket-273550"

  notification {
    lambda_function {
      lambda_function_arn = aws_lambda_function.image_processor.arn
      events              = ["s3:ObjectCreated:*"]
    }
  }

  depends_on = [
    aws_lambda_permission.allow_s3
  ]
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = "processed-images-bucket-273550"
}

output "source_bucket_name" {
  value = aws_s3_bucket.source_bucket.bucket
}

output "destination_bucket_name" {
  value = aws_s3_bucket.destination_bucket.bucket
}
