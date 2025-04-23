provider "aws" {
  region = var.region
}

module "s3_buckets" {
  source = "./modules/s3"
}

module "iam_role" {
  source = "./modules/iam"
}

module "lambda_function" {
  source          = "./modules/lambda"
  s3_bucket       = module.s3_buckets.source_bucket_name
  destination_bucket = module.s3_buckets.destination_bucket_name
  iam_role_arn    = module.iam_role.iam_role_arn
}
