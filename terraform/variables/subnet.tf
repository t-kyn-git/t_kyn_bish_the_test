variable "subnet_cidr_public" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_private_db1" {
  description = "CIDR block for the first private DB subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_cidr_private_db2" {
  description = "CIDR block for the second private DB subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "subnet_cidr_private" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.4.0/24"
}
