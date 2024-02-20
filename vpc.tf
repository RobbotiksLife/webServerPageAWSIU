# Defining VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc-1"
  }
}

# Defining Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Defining a Route to Internet Gateway for VPC Default Route Table
resource "aws_route" "internet_gateway" {
  route_table_id = aws_vpc.main.default_route_table_id
  destination_cidr_block = local.allow_all_cidr
  gateway_id = aws_internet_gateway.gw.id
}