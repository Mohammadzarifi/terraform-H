
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.instance_type
  key_name               = "key_new"

  # provisioner "local-exec" {
  #   command = "echo ${self.public_ip} >> private_ips.txt"
  # }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    content     = "./index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install apache2-bin -y",
      "sudo apt install mime-support -y",
      "sudo apt install apache2 -y",
      "sudo systemctl enable  apache2",
      "sudo systemctl start apache2",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
  }

  tags = {
    Name = "my-server-${var.env}"
    Env  = var.env
  }
}

resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"

  tags = {
    Name = "${var.security_group_name}-${var.env}"
    Env  = var.env
  }
}


resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http_ingress" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
