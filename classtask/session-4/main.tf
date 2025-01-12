resource "aws_instance" "web" {
  # provider = aws.ohio
  count                  = length(var.env)
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.instance_type
  user_data              = file("./extras/userdata.sh")

  lifecycle { //inline block
    create_before_destroy = true
  }

  tags = { //inline block 
    Name = "my-${var.env[count.index]}-instance" // var.env[2]

  }

  //depends_on = [ aws_security_group.web ]
}





/*
first iteration: count=1, count.index=0, dev
second iteration: count=2, count.index=1, qa
third iteration: count=3, count.index=2, prod



variable "env" {
  type        = list(string)
  default     = ["dev", "qa", "prod"]
  description = "This is My Dev Environment"
}


Meta arguments - change/control the behavior of infrastructure creation 
1. depends_on (explicit dependency)
2. provider = provider_name.alias 
3. lifecycle = create_before_destroy, prevent_destroy etc
4. count = creates identical resources 

terraform graph - command, shows dependency in console


index = location/position of the element in the list

fruit = ["apple", "banana", "strawberry"]
index1 = banana
index0 = apple 
index3 = Error


Limitations of COUNT:
1. tied to INDEX
2. can be used only on the resource level 
*/