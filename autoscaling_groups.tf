# Defining Autoscaling group
resource "aws_autoscaling_group" "serverasg" {
  name = "${var.project_name}-serverASG"
  max_size = var.aws_autoscaling_group_max_size
  min_size = var.aws_autoscaling_group_min_size
  desired_capacity = var.aws_autoscaling_group_desired_capacity
  vpc_zone_identifier = aws_subnet.public[*].id

  depends_on = [aws_lb_target_group.aws_lb_target_group, aws_autoscaling_group.serverasg]
  target_group_arns = [aws_lb_target_group.aws_lb_target_group.arn]

  launch_template {
    id = aws_launch_template.serverinstance.id
    version = "$Latest"
  }
}