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

# Create Public Subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}

# Create Public Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

# Create Public Subnet 3
resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/25"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-3"
  }
}

# Create Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "private-subnet-1"
  }
}

# Create Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "private-subnet-2"
  }
}

# Create Private Subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.5.0/25"
  availability_zone = "us-west-2c"
  tags = {
    Name = "private-subnet-3"
  }
}

# AWS VPC Documentation
# aws_vpc: Creates a Virtual Private Cloud (VPC) with the CIDR block 10.0.0.0/16 and names it "my_vpc".

# AWS Subnet Documentation
# Public Subnets: Creates three public subnets in different availability zones (us-west-2a, us-west-2b, us-west-2c) within the VPC. These subnets will have public IP addresses assigned automatically upon launch.
# Private Subnets: Creates three private subnets in different availability zones within the VPC. These subnets do not have public IP addresses.
