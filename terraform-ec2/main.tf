provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-0d3a2960fcac852bc"
  instance_type = "t3.micro"

  tags = {
    Name = "instance1"
  }
}

resource "aws_security_group" "isntance1_sg" {
  name        = "instance1_sg"
  description = "Allow HTTP traffic"

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance1SecurityGroup"
  }
}