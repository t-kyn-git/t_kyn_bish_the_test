variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable vpc_name {
    default  = "myvpc"
}

variable public-1a-cidr {
    default  = "10.0.1.0/24"
}
variable public-1a-name {
    default  = "my-public-1a"
}
variable public-1c-cidr {
    default  = "10.0.2.0/24"
}
variable public-1c-name {
    default  = "my-public-1c"
}
variable private-1a-cidr {
    default  = "10.0.3.0/24"
}
variable private-1a-name {
    default  = "vpc-private-1a"
}
variable private-1c-cidr {
    default  = "10.0.4.0/24"
}
variable private-1c-name {
    default  = "vpc-private-1c"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
}
