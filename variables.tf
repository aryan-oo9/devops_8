variable "region" {
  description = "The AWS region to deploy in"
  default     = "eu-north-1" # Stockholm (Free Tier Friendly)
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro" # Free Tier Eligible
}