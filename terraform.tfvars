# Project config
project_name = "project1"
aws_launch_template_key_pair_name = "MyKey"
aws_profile = "default" # define with(aws config)

# AWS Virtual Private Cloud
vpc_cidr_block = "10.0.0.0/16"
subnets_cidr_bits_difference = 4

# Region and Availability zones
aws_region = "eu-north-1" # us-west-1 -> "us-west-1"
availability_zone_types = ["a", "b", "c"] # us-west-1 -> ["a","c"]

# AWS Instance Template
aws_launch_template_type="t3.micro" # us-west-1 -> "t2.micro"
aws_launch_template_image_id="ami-087c4d241dd19276d" # us-west-1 -> "ami-02d3fd86e6a2f5122"
aws_launch_template_user_data_sh_path="user_data.sh"

# AWS Auto Scaling Group
aws_autoscaling_group_max_size = 4
aws_autoscaling_group_min_size = 2
aws_autoscaling_group_desired_capacity = 2
server_asg_estimated_instance_warmup = 300
server_asg_cpu_utilization_scaling_policy_target_value = 70.0


