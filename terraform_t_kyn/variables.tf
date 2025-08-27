variable "access_key" {
  description = "AWS Access Key"
  type        = string
  default     = "mock_access_key"
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = "mock_secret_key"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "The domain name for Route 53 hosted zone"
  type        = string
  #default     = "example.com"
	default     = "t_kyn.testaws.product.com"
}
