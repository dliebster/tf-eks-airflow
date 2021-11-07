variable "region" {
  default     = "us-gov-east-1"
  description = "AWS region"
}

variable "tfstate_bucket" {
    default     = "<tf-state-bucket-name-here>"
    description = "S3 bucket localtion of tfstate file"
}

variable "tfstate_key" {
    default     = "project/dev/airflow"
    description = "tfstate file path inside bucket"

}
