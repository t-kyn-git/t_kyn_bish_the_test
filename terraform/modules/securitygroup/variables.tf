variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "ssh_from_port" {
  description = "SSH ingress from port"
  type        = number
  default     = 22
}

variable "ssh_to_port" {
  description = "SSH ingress to port"
  type        = number
  default     = 22
}

variable "ssh_protocol" {
  description = "Protocol for SSH ingress"
  type        = string
  default     = "tcp"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks for SSH ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_from_port" {
  description = "HTTP ingress from port"
  type        = number
  default     = 80
}

variable "http_to_port" {
  description = "HTTP ingress to port"
  type        = number
  default     = 80
}

variable "http_protocol" {
  description = "Protocol for HTTP ingress"
  type        = string
  default     = "tcp"
}

variable "http_cidr_blocks" {
  description = "CIDR blocks for HTTP ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "Egress from port"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Egress to port"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "Protocol for egress"
  type        = string
  default     = "-1"  # All traffic
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
