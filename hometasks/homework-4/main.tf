resource "aws_subnet" "public"{
  count = length(var.public_subnet_cidr_blocks)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.public_subnet_cidr_blocks, count.index)
  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.private_subnet_cidr_blocks, count.index)
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}

