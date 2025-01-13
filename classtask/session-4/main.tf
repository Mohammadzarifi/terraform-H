resource "aws_instance" "web" { // parent block
  count                  = length(var.env)
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.instance_type
  user_data              = file("./extras/userdata.sh")

  // inline block
  lifecycle {
    create_before_destroy = true
  }

  tags = { // inline block 
    Name = "my-${var.env[count.index]}-instance"
  
  }
}


/*

variable "env" {
  type        = string
  default     = ["dev", "qa", "prod"]  # Change this list as needed
  description = "This is My Dev Environment"
}



count = is added to the resource block
and count index is added to the tags block and after adding -> (count.index if we want to start the number from 1 we need to add +1 like this (count.index + 1) 
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.instance_type
  user_data = file("./extras/userdata.sh")

  tags = {
    Name = "my-server-${var.env}"
    Env  = var.env
  }
}
index is the location or position of the item in the list


*/