# Defining target group with HTTP protocol
resource "aws_lb_target_group" "aws_lb_target_group" {
  name = "${var.project_name}-serverTG"
  port = 80
  protocol = local.http_protocol_str
  vpc_id = aws_vpc.main.id
}

# Defining application Load Balancer
resource "aws_lb" "serverlb" {
  name = "${var.project_name}-serverLB"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.web.id]
  subnets = [ for subnet in aws_subnet.public : subnet.id ]
}

# Defining Load Balancer target group listener
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.serverlb.arn
  port = "80"
  protocol = local.http_protocol_str

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group.arn
  }
}