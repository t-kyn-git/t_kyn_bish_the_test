variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-12345678"
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}
