module "vpc" {
  source = "./modules/vpc"
}

module "network" {
  source = "./modules/network"
}

module "ec2" {
  source      = "./modules/ec2"

  # Pass necessary variables to the EC2 module
  public_subnet_id   = module.network.public_subnet_id
  private_subnet_id  = module.network.private_subnet_id
  private_subnet_db1_id = module.network.private_subnet_db1_id
  private_subnet_db2_id = module.network.private_subnet_db2_id
	security_group_ids = [module.securitygroup.security_group_id]
  db_write_security_group_ids = [module.securitygroup.db_write_security_group_id]
  db_read_security_group_ids  = [module.securitygroup.db_read_security_group_id]
}

module "securitygroup" {
  source = "./modules/securitygroup"

  # Pass the VPC ID to the security group module
  vpc_id = module.network.vpc_id  # Pass the VPC ID from the network module
}

module "s3" {
  source = "./modules/s3"
}

module "lambda" {
  source      = "./modules/lambda"

  # Pass necessary variables to the Lambda module
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

  # Pass necessary variables to the Route 53 module
  domain_name = var.domain_name
}
