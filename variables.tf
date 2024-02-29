variable "aws_launch_template_type" {
  type = string
  default = "t3.micro"
}

variable "aws_launch_template_image_id" {
  type = string
  default = "ami-087c4d241dd19276d"
}

variable "aws_launch_template_user_data_sh_path" {
  type = string
  default = "user_data.sh"
}

variable "aws_launch_template_key_pair_name" {
  type = string
  default = "MyKey"
}

variable "aws_region" {
  type = string
  default = "eu-north-1"
}

variable "aws_profile" {
  type = string
  default = "default"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.1.0.0/16"
}

variable "project_name" {
  type = string
  default = "project1"
}

variable "availability_zone_types" {
  type = list(string)
  default = ["a", "b", "c"]
}

variable "aws_autoscaling_group_max_size" {
  type = number
  default = 4
}

variable "aws_autoscaling_group_min_size" {
  type = number
  default = 2
}

variable "aws_autoscaling_group_desired_capacity" {
  type = number
  default = 2
}

variable "subnets_cidr_bits_difference" {
  type = number
  default = 4
}

variable "server_asg_estimated_instance_warmup" {
  type = number
  default = 300
}

variable "server_asg_cpu_utilization_scaling_policy_target_value" {
  type = number
  default = 70.0
}