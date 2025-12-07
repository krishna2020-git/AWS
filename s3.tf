# S3 Bucket Configuration

# Create an S3 bucket
resource "aws_s3_bucket" "app_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "app-bucket"
  }
}

# Enable versioning on the bucket
resource "aws_s3_bucket_versioning" "app_bucket_versioning" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access to the bucket
resource "aws_s3_bucket_public_access_block" "app_bucket_pab" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "app_bucket_sse" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Output the S3 bucket name
output "s3_bucket_name" {
  value       = aws_s3_bucket.app_bucket.id
  description = "The name of the S3 bucket"
}

# Output the S3 bucket ARN
output "s3_bucket_arn" {
  value       = aws_s3_bucket.app_bucket.arn
  description = "The ARN of the S3 bucket"
}
