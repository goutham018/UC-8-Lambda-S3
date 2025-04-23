resource "aws_lambda_function" "image_processor" {
  filename         = "./lambda_function.zip"
  function_name    = "image_processor"
  role             = var.iam_role_arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = filebase64sha256("./lambda_function.zip")

  environment {
    variables = {
      SOURCE_BUCKET      = var.s3_bucket
      DESTINATION_BUCKET = var.destination_bucket
    }
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.lambda_policy_attachment
  # ]
}

# resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
#   role       = var.iam_role_arn
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.image_processor.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::source-images-bucket-273550"
}

# filepath: /workspaces/AssistedProjects/use-case/UC-8-Lambda-S3/modules/lambda/outputs.tf
output "lambda_function_arn" {
  value = aws_lambda_function.image_processor.arn
}
# filepath: /workspaces/AssistedProjects/use-case/UC-8-Lambda-S3/modules/lambda/outputs.tf
output "lambda_permission_id" {
  value = aws_lambda_permission.allow_s3.id
}