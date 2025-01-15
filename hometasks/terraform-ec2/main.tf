provider "aws" {
  region = "us-west-2"  # region
}

resource "aws_instance" "web" {
  ami             = "ami-00198294ed4395e0d"  # AMI copied from Aws
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

