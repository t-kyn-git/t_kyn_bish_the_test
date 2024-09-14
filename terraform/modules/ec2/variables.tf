# variables.tf

variable "public_instance_ami" {
  description = "AMI ID for the public EC2 instance"
  type        = string
  default     = "ami-12345678"  # Default value for LocalStack
}

variable "private_instance_ami" {
  description = "AMI ID for the private EC2 instance"
  type        = string
  default     = "ami-12345678"  # Default value for LocalStack
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

#variable "public_subnet_id" {
#  description = "Subnet ID for the public EC2 instance"
#  type        = string
#}

#variable "private_subnet_id" {
#  description = "Subnet ID for the private EC2 instance"
#  type        = string
#}
