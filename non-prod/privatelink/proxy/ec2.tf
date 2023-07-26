resource "aws_instance" "ec2-nginx" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = var.instance_type
  subnet_id              = var.subnet
  vpc_security_group_ids = [aws_security_group.nginx_proxy.id]
  key_name               = var.key_name
  user_data              = file("userdata.tpl")
  tags = {
    Name = var.ec2_proxy_name
  }
}

resource "aws_security_group" "nginx_proxy" {
  name        = "nginx_proxy"
  description = "SSH on port 22 and HTTP(S) on port 80/443"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}