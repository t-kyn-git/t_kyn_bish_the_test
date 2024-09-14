# main.tf

# Variablesの読み込み
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

# モジュールの読み込み
module "resources" {
  source = "./resources"

  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

# 出力の定義
output "vpc_id" {
  value = module.resources.vpc_id
}

output "subnet_id" {
  value = module.resources.subnet_id
}
