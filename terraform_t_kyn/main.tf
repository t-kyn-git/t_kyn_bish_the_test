module "vpc" {
  source = "./modules/vpc"
}

module "network" {
  source = "./modules/network"
}

module "ec2" {
  source      = "./modules/ec2"
  public_subnet_id   = module.network.public_subnet_id
  private_subnet_id  = module.network.private_subnet_id
	security_group_ids = [module.securitygroup.allow_http_ssh]
}

module "securitygroup" {
  source = "./modules/securitygroup"
  vpc_id = module.network.vpc_id  # Pass the VPC ID from the network module
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
