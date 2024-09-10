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

# データ定義
#data "archive_file" "example_zip" {
#  type        = "zip"
#  source_dir  = "lambda"
#  output_path = "lambda/lambda_function_payload.zip"
#}

# データ定義: ZIP ファイルの作成
data "archive_file" "example_zip" {
  type        = "zip"
  source_file = "lambda/index.js"   # index.js のパスを正確に指定
  output_file_mode = "0666"
  output_path = "/tmp/lambda_function_payload.zip"
  # output_path = "lambda/lambda_function_payload.zip"
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

resource "aws_subnet" "private_subnet_db1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_subnet_db2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1d"
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
resource "aws_lambda_function" "lambda_function_payload" {
  function_name = "lambda_function_payload"
  role          = aws_iam_role.lambda_role.arn
	handler       = "index.handler"
	runtime       = "nodejs14.x"
	filename         = data.archive_file.example_zip.output_path
	source_code_hash = data.archive_file.example_zip.output_base64sha256
}

resource "aws_lambda_function_url" "lambda_function_url" {
  function_name      = aws_lambda_function.lambda_function_payload.function_name
  authorization_type = "NONE"
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

# IAMポリシーの追加: LambdaがS3とAPI Gatewayにアクセスするためのポリシー
resource "aws_iam_role_policy_attachment" "lambda_s3_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_api_gateway_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
}

# Lambda の基本的な権限を追加
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# RDS マスターデータベース (MySQL)
#resource "aws_db_instance" "master" {
#  identifier              = "mysql-master-db"
#  allocated_storage       = 10
#  engine                  = "mysql"
#  engine_version          = "5.7"
#  instance_class          = "db.t2.micro"
#  username                = "admin"
#  password                = "password"
#  #db_subnet_group_name    = aws_db_subnet_group.default.name
#  skip_final_snapshot     = true
#  publicly_accessible     = true
#}

# RDS レプリカ
#resource "aws_db_instance" "replica" {
#  identifier              = "mysql-replica-db"
#  allocated_storage       = 10
#  engine                  = "mysql"
#  engine_version          = "5.7"
#  instance_class          = "db.t2.micro"
#  username                = "admin"
#  password                = "password"
#  #db_subnet_group_name    = aws_db_subnet_group.default.name
#  replicate_source_db     = aws_db_instance.master.id
#  publicly_accessible     = true
#}

## RDS Subnet Group
#resource "aws_db_subnet_group" "default" {
#  name       = "rds-subnet-group"
#  subnet_ids = ["private_subnet_db1", "private_submet_db2"]  # 実際のサブネットIDを設定
#  tags = {
#    Name = "My RDS subnet group"
#  }
#}

# EC2のセキュリティグループ作成（MySQL接続用）
resource "aws_security_group" "allow_mysql" {
  name        = "allow_mysql"
  description = "Allow MySQL inbound traffic from local network"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 全てのIPアドレスを許可
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2用セキュリティグループ
resource "aws_security_group" "allow_http_ssh" {
  vpc_id = aws_vpc.main_vpc.id

  # SSHアクセスを許可
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPアクセスを許可
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 全てのアウトバウンドトラフィックを許可
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# CloudWatchログ用のポリシー
resource "aws_iam_role_policy_attachment" "lambda_cloudwatch_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

# EC2インスタンス作成（ローカルのMySQLに接続）
resource "aws_instance" "mysql_client" {
  ami                    = "ami-12345678"  # LocalStackで使用可能なAMI
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.allow_mysql.name]

  # EC2のUser DataでMySQLに接続するためのスクリプトを設定
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y mysql-client

              # ローカルのMySQLに接続するためのテスト
              mysql -h <ローカルのMySQLのIPアドレス> -u admin -ppassword -e "SHOW DATABASES;"
              EOF

  tags = {
    Name = "MySQL-Client-EC2"
  }
}


# CloudWatch メトリクス
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "120"
  statistic           = "Average"
  threshold           = "75"

  #dimensions = {
  #  DBInstanceIdentifier = aws_db_instance.master.id
  #}

  alarm_description = "This metric monitors RDS master DB CPU usage"
  actions_enabled   = true
}

#output "rds_master_endpoint" {
#  value = aws_db_instance.master.endpoint
#}

#output "rds_replica_endpoint" {
#  value = aws_db_instance.replica.endpoint
#}

# Route 53 ホストゾーンの作成
resource "aws_route53_zone" "my_zone" {
  name = var.domain_name
}

# Aレコードの作成（EC2のパブリックIPを使用）
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.my_zone.zone_id
  name    = "www"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.public_instance.public_ip]
}

# CNAMEレコードの作成
resource "aws_route53_record" "cname" {
  zone_id = aws_route53_zone.my_zone.zone_id
  name    = "api"
  type    = "CNAME"
  ttl     = "300"
  records = ["www.${var.domain_name}"]
}

# Route 53 ドメイン名の変数
variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
  default     = "example.com"
}

output "cloudwatch_alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}


#Output
# VPC ID を出力する
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

# サブネット ID を出力する
output "subnet_id" {
  value = aws_subnet.public_subnet.id
}