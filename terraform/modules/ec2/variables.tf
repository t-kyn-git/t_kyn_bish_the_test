variable "ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-12345678"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "10.0.0.0/16"
}

