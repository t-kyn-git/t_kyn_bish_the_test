variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_db1_cidr_block" {
  description = "The CIDR block for the first private subnet (DB1)"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_db2_cidr_block" {
  description = "The CIDR block for the second private subnet (DB2)"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the third private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "public_subnet_availability_zone" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_db1_availability_zone" {
  description = "The availability zone for the first private subnet (DB1)"
  type        = string
  default     = "us-east-1b"
}

variable "private_subnet_db2_availability_zone" {
  description = "The availability zone for the second private subnet (DB2)"
  type        = string
  default     = "us-east-1c"
}

variable "private_subnet_availability_zone" {
  description = "The availability zone for the third private subnet"
  type        = string
  default     = "us-east-1d"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
}
