# Defining public subnets for different availability zones
resource "aws_subnet" "public" {
  count = length(local.availability_zones)
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, var.subnets_cidr_bits_difference, count.index)
  availability_zone = local.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-${count.index}-${local.availability_zones[count.index]}"
  }
}

# Associate Public Subnets with VPC Default Route Table
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_vpc.main.default_route_table_id
}