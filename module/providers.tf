provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::191600387477:role/terraform-deploy"
  }
}

