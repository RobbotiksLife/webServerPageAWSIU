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
    version = aws_launch_template.serverinstance.latest_version # "$Latest"
  }
}

# Define Autoscaling Policy with Target Tracking Configuration
resource "aws_autoscaling_policy" "cpu_utilization_scaling_policy" {
  name = "${var.project_name}-cpu-utilization-scaling-policy"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = var.server_asg_estimated_instance_warmup
  autoscaling_group_name = aws_autoscaling_group.serverasg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.server_asg_cpu_utilization_scaling_policy_target_value
    disable_scale_in = false
  }
}