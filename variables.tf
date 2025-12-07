variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

# variable "ami_id" {
#   type        = string
#   description = "AMI ID for the EC2 instance"
#   default     = "ami-02b8269d5e85954ef" # Amazon Linux 2 AMI for us-east-1
# }

# variable "instance_type" {
#   type        = string
#   description = "Instance type for the EC2 instance"
#   default     = "t3.micro"
# }

# variable "key_name" {
#   type        = string
#   description = "EC2 Key Pair name for SSH access"
#   default     = "aws-key" # Provide your key pair name
# }

variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  default     = "app-bucket-terraform-12345" # Change to a globally unique name
}
