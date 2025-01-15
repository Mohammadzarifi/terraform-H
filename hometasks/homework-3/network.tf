# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw"
  }
}

# Allocate Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Create NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "my_nat_gateway"
  }
}

# Create Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

# Create Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private_route_table"
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_3" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.public.id
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_3" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private.id
}

# AWS Internet Gateway Documentation
# aws_internet_gateway: Creates an internet gateway and attaches it to the VPC.

# AWS EIP Documentation
# aws_eip: Allocates an Elastic IP address for use in a VPC.

# AWS NAT Gateway Documentation
# aws_nat_gateway: Creates a NAT gateway using the allocated Elastic IP address and attaches it to one of the public subnets (public_subnet_1).

# AWS Route Table Documentation
# aws_route_table: Creates route tables for the public and private subnets. The public route table directs traffic to the internet gateway, while the private route table directs traffic to the NAT gateway.

# AWS Route Table Association Documentation
# aws_route_table_association: Associates the subnets with their respective route tables.
