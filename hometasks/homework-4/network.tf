resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr_blocks)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.public_subnet_cidr_blocks, count.index)
  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr_blocks)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.private_subnet_cidr_blocks, count.index)
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}




# # Create Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.my_vpc.id
#   tags = {
#     Name = "my_igw"
#   }
# }

# # Allocate Elastic IP for NAT Gateway
# resource "aws_eip" "nat_eip" {
#   domain = "vpc"
# }

# # Create NAT Gateway
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public_subnet[0].id
#   tags = {
#     Name = "my_nat_gateway"
#   }
# }

# # Create Route Tables
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "public_route_table"
#   }
# }

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }

#   tags = {
#     Name = "private_route_table"
#   }
# }

# # Associate Public Subnets with Public Route Table
# resource "aws_route_table_association" "public_subnet_assoc" {
#   count          = 3
#   subnet_id      = aws_subnet.public_subnet[count.index].id
#   route_table_id = aws_route_table.public.id
# }

# # Associate Private Subnets with Private Route Table
# resource "aws_route_table_association" "private_subnet_assoc" {
#   count          = 3
#   subnet_id      = aws_subnet.private_subnet[count.index].id
#   route_table_id = aws_route_table.private.id
# }
