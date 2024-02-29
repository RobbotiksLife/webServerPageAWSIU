# Defining security group for HTTP and SSH
resource "aws_security_group" "web" {
  name = "${var.project_name}-SG-1"
  description = "Allow inbound traffic for HTTP and SSH"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = local.tcp_protocol_str
    cidr_blocks = [local.allow_all_cidr]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = local.tcp_protocol_str
    cidr_blocks = [local.allow_all_cidr]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [local.allow_all_cidr]
  }
}
