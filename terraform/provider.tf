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
    rds       = "http://localhost:4566"
    cloudwatch = "http://localhost:4566"
  }
}
