provider "aws" {
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  region                      = var.region
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  endpoints {
    ec2            = "http://localhost:4566"
    s3             = "http://localhost:4566"
    apigateway     = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
  }
}

module "vpc" {
  source = "./modules/vpc"
}

#vpc_id      = module.vpc.vpc_id
module "ec2" {
  source      = "./modules/ec2"
  vpc_id      = aws_vpc.main_vpc.id
  subnet_id   = aws_subnet.public_subnet.id
}

module "s3" {
  source = "./modules/s3"
}

module "lambda" {
  source      = "./modules/lambda"
  s3_bucket   = module.s3.bucket_name
}

module "apigateway" {
  source = "./modules/apigateway"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

module "route53" {
  source      = "./modules/route53"
  domain_name = var.domain_name
}
