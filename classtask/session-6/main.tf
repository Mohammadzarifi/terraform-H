resource "aws_instance" "web" {
  count = 3
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type = var.env == "prod" ? var.instance_type[1] : var.instance_type[0]
  user_data              = file("./extras/userdata.sh")

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {Name = format(local.Name, "ec2")},
    local.common_tags
  )
}


