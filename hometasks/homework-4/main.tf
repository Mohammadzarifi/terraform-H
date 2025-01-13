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

locals {
  public_subnet_cidrs  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
  availability_zones   = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

# Define Public Subnets
resource "aws_subnet" "public_subnet" {
  count             = 3
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.public_subnet_cidrs[count.index]
  availability_zone = local.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Define Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = 3
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.private_subnet_cidrs[count.index]
  availability_zone = local.availability_zones[count.index]
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

