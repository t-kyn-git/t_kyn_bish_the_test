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

module "network" {
  source = "./modules/network"
  vpc_cidr_block                        = "10.0.0.0/16"
  public_subnet_cidr_block              = "10.0.1.0/24"
  private_subnet_db1_cidr_block         = "10.0.2.0/24"
  private_subnet_db2_cidr_block         = "10.0.3.0/24"
  private_subnet_cidr_block             = "10.0.4.0/24"
  public_subnet_availability_zone       = "us-east-1a"
  private_subnet_db1_availability_zone  = "us-east-1b"
  private_subnet_db2_availability_zone  = "us-east-1c"
  private_subnet_availability_zone      = "us-east-1d"
}

#vpc_id      = module.vpc.vpc_id
#vpc_id      = aws_vpc.main_vpc.id
#subnet_id   = aws_subnet.public_subnet.id
#vpc_id      = module.network.vpc_id
#public_subnet_id   = module.network.public_subnet_id
#private_subnet_id   = module.network.public_subnet_id

module "ec2" {
  source      = "./modules/ec2"
  vpc_id             = module.network.vpc_id
  public_subnet_id   = module.network.public_subnet_id
  private_subnet_id  = module.network.private_subnet_id
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
