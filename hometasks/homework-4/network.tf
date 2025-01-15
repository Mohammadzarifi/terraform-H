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




/*
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
*/