# SSHポート設定
variable "ssh_from_port" {
  description = "The from port for SSH"
  type        = number
  default     = 22
}

variable "ssh_to_port" {
  description = "The to port for SSH"
  type        = number
  default     = 22
}

variable "ssh_protocol" {
  description = "The protocol for SSH"
  type        = string
  default     = "tcp"
}

variable "ssh_cidr_blocks" {
  description = "The CIDR blocks for SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# HTTPポート設定
variable "http_from_port" {
  description = "The from port for HTTP"
  type        = number
  default     = 80
}

variable "http_to_port" {
  description = "The to port for HTTP"
  type        = number
  default     = 80
}

variable "http_protocol" {
  description = "The protocol for HTTP"
  type        = string
  default     = "tcp"
}

variable "http_cidr_blocks" {
  description = "The CIDR blocks for HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# egress設定
variable "egress_from_port" {
  description = "The from port for egress"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "The to port for egress"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "The protocol for egress"
  type        = string
  default     = "-1"
}

variable "egress_cidr_blocks" {
  description = "The CIDR blocks for egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
