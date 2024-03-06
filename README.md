# Terraform Website Infrastructure Deployment Readme

## Overview
This Terraform script automates the deployment of a scalable web application infrastructure on Amazon Web Services (AWS). It sets up a Virtual Private Cloud (VPC), subnets, security groups, load balancer, autoscaling group, and EC2 instances running a basic web server.

## Prerequisites
Before running this Terraform script, ensure you have the following prerequisites:

1. **AWS Account**: You must have an AWS account with appropriate permissions to create resources.
2. **Terraform**: Install Terraform on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
3. **AWS CLI**: Configure AWS CLI with appropriate credentials on your local machine. You can install AWS CLI and configure it by following the instructions on the [AWS CLI documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html).

## Configuration
### `terraform.tfvars`
This file contains configurable variables used in the Terraform configuration. Update this file with your desired values before running Terraform. Here's a breakdown of the variables:

- `project_name`: The name of your project.
- `aws_launch_template_key_pair_name`: The name of the SSH key pair used for EC2 instances.
- `aws_profile`: The AWS profile configured in your AWS CLI.
- `vpc_cidr_block`: The CIDR block for the VPC.
- `subnets_cidr_bits_difference`: The difference in CIDR block bits for subnet creation.
- `aws_region`: The AWS region where resources will be deployed.
- `availability_zone_types`: The availability zones to use in the specified region.
- `aws_launch_template_type`: The EC2 instance type for the launch template.
- `aws_launch_template_image_id`: The AMI ID for the EC2 instances.
- `aws_launch_template_user_data_sh_path`: The path to the user data script for EC2 instances.
- `aws_autoscaling_group_max_size`: The maximum number of instances in the autoscaling group.
- `aws_autoscaling_group_min_size`: The minimum number of instances in the autoscaling group.
- `aws_autoscaling_group_desired_capacity`: The desired number of instances in the autoscaling group.
- `server_asg_estimated_instance_warmup`: The estimated warm-up time for instances in the autoscaling group.
- `server_asg_cpu_utilization_scaling_policy_target_value`: The target CPU utilization percentage for autoscaling.

### Terraform Files
- **`vpc.tf`**: Define VPC configuration.
- **`subnets.tf`**: Define public subnets and routing.
- **`security_groups.tf`**: Configure security groups for EC2 instances.
- **`load_balancers.tf`**: Configure ALB, target group, and listener.
- **`autoscaling_groups.tf`**: Define Autoscaling Group and associated policies.
- **`launch_template.tf`**: Specify launch template for EC2 instances.
- **`output.tf`**: Output DNS name of the load balancer.
- **`providers.tf`**: Specify Terraform providers and versions.
- **`user_data.sh`**: User data script for EC2 instances.
- **`variables.tf`**: Declare input variables for the Terraform configuration.
- **`terraform.tfvars`**: Redefine variables for the Terraform configuration.
- **`locals.tf`**: Define local values and computations.


## Running the Script
1. **Initialize Terraform**: Run `terraform init` to initialize Terraform and download necessary providers.
2. **Preview Changes**: Run `terraform plan` to see the execution plan and review the changes Terraform will make.
3. **Apply Changes**: Run `terraform apply` to apply the changes and deploy the infrastructure.
4. **Access the Application**: Once Terraform completes, you will get the DNS name of the load balancer. Access this DNS in a web browser to view your application.

## Cleaning Up
To avoid incurring unnecessary charges, remember to destroy the resources created by Terraform when they are no longer needed. Run `terraform destroy` to remove all resources created by this script.

## Maintenance
- **Updating Infrastructure**: Modify the `terraform.tfvars` file with any changes and reapply the Terraform script.
- **Monitoring and Scaling**: Monitor the application's performance and scale resources as needed using AWS services such as CloudWatch and Auto Scaling.
- **Security**: Regularly review and update security groups and access controls to ensure the infrastructure remains secure.

## Author
This Code was created by Volodymyr Bezpalko.