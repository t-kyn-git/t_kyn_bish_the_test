# variables.tf
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
}

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

variable "public_subnet_id" {
  description = "Subnet ID for the public EC2 instance"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_id" {
  description = "Subnet ID for the private EC2 instance"
  type        = string
  default     = "10.0.2.0/24"
}
