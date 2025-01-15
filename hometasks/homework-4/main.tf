provider "aws" {
  region = "us-west-2"
}

# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet" {
  count             = 3
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(["10.0.0.128/25", "10.0.1.0/25", "10.0.2.0/25"], count.index)
  availability_zone = element(["us-west-2a", "us-west-2b", "us-west-2c"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = 3
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"], count.index)
  availability_zone = element(["us-west-2a", "us-west-2b", "us-west-2c"], count.index)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}
