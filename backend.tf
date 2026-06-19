terraform {

  backend "s3" {

    bucket         = "terraform-state-hemanth-2026"
    key            = "rds-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"

    encrypt = true
  }
}