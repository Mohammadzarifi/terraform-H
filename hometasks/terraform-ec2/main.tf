provider "aws" {
  region = "us-east-1"  # or your preferred region
}

resource "aws_instance" "web" {
  ami             = "ami-0abcdef1234567890"  # Replace with your Amazon Linux 2023 AMI ID
  instance_type   = "t2.micro"

  tags = {
    Name = "my-terraform-webserver"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><body><h1>Session-2 homework is complete!</h1></body></html>" > /var/www/html/index.html
              EOF
}

output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

