provider "aws" {
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  endpoints {
    ec2            = "http://localhost:4566"
    s3             = "http://localhost:4566"
    apigateway     = "http://localhost:4566"
    lambda         = "http://localhost:4566"
  }
}

# VPCの作成
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# サブネットの作成
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

# EC2 インスタンスの作成（パブリックとプライベート）
resource "aws_instance" "public_instance" {
  ami           = "ami-12345678"  # LocalStackで使うモックAMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_instance" "private_instance" {
  ami           = "ami-12345678"  # LocalStackで使うモックAMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
}

# S3 バケットの作成
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucket"
}

# API Gateway の作成
resource "aws_api_gateway_rest_api" "my_api" {
  name = "MyAPI"
}

# Lambda 関数の作成
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = "lambda_function_payload.zip"
}

# Lambda 関数の IAM ロール
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "lambda.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

# Lambda の基本的な権限を追加
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
