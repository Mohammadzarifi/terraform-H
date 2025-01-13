resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.instance_type
  tags = {
    Name = "my-server-${var.env}"
    Env = var.env
  }
}

resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"

  tags = {
    Name = "${var.security_group_name}-${var.env}"
    Env = var.env
  }
}


resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
/*
References:
1. Resource Attribue Reference -> Implicit Dependency
    PROVIDER_TYPE.LogicalID.Attribute
    first_label.second_label.attr

2. Variable Reference 
   var.variable_name

3. Data source Reference
   data.first_label.second_label.attr

PORT = application -> http/https/ftp/ssh
PROTOCOL = transport -> tcp, icmp, udp

Data Types:
[] - list 
{} - Map
"" - double quotation
boolean, number - NOTHING

String Interpolation = a method of embedding variable value within a string

my_server_dev
my_server_prod
my_server_qa


VARIABLES:
1. In config file, give default value
2. Give value in command: terraform apply -var=instance_type=t2.micro
3. Environment Variable: TF_VAR_variable_name
*/