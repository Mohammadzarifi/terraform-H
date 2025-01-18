###### application load balncer #####
resource "aws_lb" "test" {
  name               = "infra-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.infras-lb.id]
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnet_ids[*] 
}
##### ALB's target group #####
resource "aws_lb_target_group" "my-infras" {
  name     = "infars-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
}

##### ALB's listener #####
resource "aws_lb_listener" "my-infras" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
 ##### specifies the target of ARN #####
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-infras.arn
  }
}

##### ALB's security group ######
resource "aws_security_group" "infras-lb" {
  name        = "allow_tls-infras"
  description = "this is new SG for my application load balancer"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id 

  tags = {
    Name = "SG-alb-infras"
  }
}
# inbound rules for ALB's securuty group
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.infras-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }
#outbound rules for ALB's security group
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.infras-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#launch template
resource "aws_launch_template" "launch_template" {
  name          = "launch_template"
  image_id      = "ami-0025f0db847eb6254"
  instance_type = "t2.micro"

network_interfaces {
  associate_public_ip_address = false
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  security_groups             = aws_security_group.infras-lb.id
  
}

tag_specifications {
  resource_type = "instance"

 tags = merge(
  { Name = format(local.Name, "launch-template") },
 local.common_tags)

  }
  user_data = filebase64("${path.module}/userdata.sh")
}




