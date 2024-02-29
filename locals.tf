locals {
  aws_launch_template_instance_name = "${var.project_name}-server-instance"
  availability_zones = [ for zone_type in var.availability_zone_types : "${var.aws_region}${zone_type}"]

  # Constants
  http_protocol_str = "HTTP"
  tcp_protocol_str = "tcp"
  allow_all_cidr = "0.0.0.0/0"
}