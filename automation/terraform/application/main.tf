resource "aws_instance" "application" {
  ami = var.instance_ami
  instance_type = var.instance_type
  key_name = var.instance_key_name

  count = var.instance_count

  security_groups = [aws_security_group.application.name]

  tags = {
    Name = "${var.stage}-application"
  }
}

resource "aws_security_group" "application" {
  name        = "${var.stage}-application"
  description = "Allow inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP web app"
    from_port   = 8080
    to_port     = 8080
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
    Name = "${var.stage}-application"
  }
}