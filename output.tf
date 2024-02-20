output "serverlb_dns_name" {
  description = "DNS name of the load balancer"
  value = "http://${aws_lb.serverlb.dns_name}"
}