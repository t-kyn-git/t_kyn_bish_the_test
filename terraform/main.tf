provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_access_key            = "mock_secret_key"
  skip_credentials_validation  = true
  skip_requesting_account_id   = true
  s3_force_path_style          = true
  endpoints {
    ec2        = "http://localhost:4566"
    iam        = "http://localhost:4566"
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_instance" "master" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  iam_instance_profile = aws_iam_role.ec2_role.id

  tags = {
    Name = "MySQL-Master"
  }
}

resource "aws_instance" "replica" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  iam_instance_profile = aws_iam_role.ec2_role.id

  tags = {
    Name = "MySQL-Replica"
  }
}
