provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # Amazon Linux 2023
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "SecureWebServer"
  }

  root_block_device {
    volume_size = 20
    encrypted   = true
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow web traffic"
  
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
