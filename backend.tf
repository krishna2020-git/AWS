terraform {
  backend "s3" {
    bucket         = "aws-tf-state-bucket"    # create this S3 bucket
    key            = "aws/ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "aws-tf-lock-table"      # create this DynamoDB table
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
