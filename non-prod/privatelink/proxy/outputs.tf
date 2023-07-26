output "ec2_instance_private_ips" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.ec2-nginx.private_ip
}
output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.ec2-nginx.public_ip
}