terraform {
  backend "s3" {
    bucket = "tf-state-dev-01"
    key    = "project/dev/airflow"
    region = "us-gov-east-1"
  }
}

provider "aws" {
  # access_key = var.AWS_ACCESS_KEY
  # secret_key = var.AWS_SECRET_KEY
  region     = var.region
  shared_credentials_file = "/Users/this/.aws/credentials"
  profile    = "gov"
}
