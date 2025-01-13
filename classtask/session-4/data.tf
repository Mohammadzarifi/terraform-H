data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

<<<<<<< HEAD
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}
=======
data "aws_subnet" "default_subnets" {
  vpc_id            = data.aws_vpc.default_vpc.id
  availability_zone = "us-east-1c"
}
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
