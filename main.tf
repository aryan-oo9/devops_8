provider "aws" {
  region = var.region
}

resource "aws_iam_role" "ec2_role" {
  name = "experiment8_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "aryan-cloud-automation-2026"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0aaa636894689fa47" 
  instance_type = var.instance_type
  tags = { Name = "Jenkins-Automated-Node" }

  # This replaces the Ansible Playbook!
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Deployed via Jenkins Pipeline</h1>" > /var/www/html/index.html
              EOF
}