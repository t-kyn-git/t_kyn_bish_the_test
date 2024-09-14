vpc_cidr = "10.0.0.0/16"

subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24",
  "10.0.4.0/24"
]

subnet_availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c",
  "us-east-1d"
]

# terraform.tfvars

public_instance_ami = "ami-12345678"
private_instance_ami = "ami-12345678"
instance_type = "t2.micro"
public_subnet_id = "subnet-12345678"  # Example subnet ID
private_subnet_id = "subnet-87654321"  # Example subnet ID
