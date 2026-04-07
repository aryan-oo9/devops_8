provider "aws" {
  region = var.region # Uses the variable from variables.tf
}

# IAM Role for EC2 (Step 6 of procedure)
resource "aws_iam_role" "ec2_role" {
  name = "experiment8_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

# S3 Bucket (Step 3 of procedure)
resource "aws_s3_bucket" "lab_bucket" {
  bucket = "aryan-cloud-automation-2026"
}

# EC2 Instance (Step 3 of procedure)
resource "aws_instance" "web_server" {
  ami           = "ami-0aaa636894689fa47" # Amazon Linux 2023
  instance_type = var.instance_type       # Uses the variable from variables.tf
  tags = { Name = "Jenkins-Ansible-Node" }
}