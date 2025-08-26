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

variable "private_instance_db_ami" {
  description = "The AMI ID for the private EC2 mysql instance"
  type        = string
  default     = "ami-mysql3306"  # Replace with the actual AMI ID
}

variable "private_instance_db_type" {
  description = "The instance type for the private EC2 mysql instance"
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

variable "private_subnet_db1_id" {
  description = "The subnet ID for the mysql master EC2 instance"
  type        = string
}

variable "private_subnet_db2_id" {
  description = "The subnet ID for the mysql slave EC2 instance"
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

variable "private_db1_instance_name" {
  description = "The name tag for the mysql master EC2 instance"
  type        = string
  default     = "PrivateMysqlMasterInstance"
}

variable "private_db2_instance_name" {
  description = "The name tag for the mysql slave EC2 instance"
  type        = string
  default     = "PrivateMysqlSlaveInstance"
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance."
  type        = list(string)
}

variable "db_write_security_group_ids" {
  description = "A list of security group IDs to associate with the mysql master EC2 instance."
  type        = list(string)
}

variable "db_read_security_group_ids" {
  description = "A list of security group IDs to associate with the mysql slave EC2 instance."
  type        = list(string)
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}