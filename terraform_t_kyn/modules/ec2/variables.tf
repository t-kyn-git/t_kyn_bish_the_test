variable "public_instance_ami" {
  description = "The AMI ID for the public EC2 instance"
  type        = string
  default     = "ami-12345678"  # Replace with the actual AMI ID
}

variable "public_instance_type" {
  description = "The instance type for the public EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "private_instance_ami" {
  description = "The AMI ID for the private EC2 instance"
  type        = string
  default     = "ami-12345678"  # Replace with the actual AMI ID
}

variable "private_instance_type" {
  description = "The instance type for the private EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "The subnet ID for the public EC2 instance"
  type        = string
}

variable "private_subnet_id" {
  description = "The subnet ID for the private EC2 instance"
  type        = string
}

variable "public_instance_name" {
  description = "The name tag for the public EC2 instance"
  type        = string
  default     = "PublicInstance"
}

variable "private_instance_name" {
  description = "The name tag for the private EC2 instance"
  type        = string
  default     = "PrivateInstance"
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance."
  type        = list(string)
}

