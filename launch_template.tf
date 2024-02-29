# Defining Launch Template
resource "aws_launch_template" "serverinstance" {
  name_prefix = "${local.aws_launch_template_instance_name}-"
  image_id = var.aws_launch_template_image_id
  instance_type = var.aws_launch_template_type
  key_name = var.aws_launch_template_key_pair_name

  user_data = filebase64(var.aws_launch_template_user_data_sh_path)

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.web.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = local.aws_launch_template_instance_name
    }
  }
}