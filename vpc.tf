resource "aws_vpc" "cloudrock" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "cloudrock"
  }
}


#Public subnet 1
resource "aws_subnet" "public-sub-1" {
  vpc_id            = aws_vpc.cloudrock.id
  cidr_block        = var.pub_sub_1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "public-sub-1"
  }
}


#public subnet 2
resource "aws_subnet" "public-sub-2" {
  vpc_id            = aws_vpc.cloudrock.id
  cidr_block        = var.pub_sub_2
  availability_zone = "eu-west-2b"

  tags = {
    Name = "public-sub-2"
  }
}


#public subnet 3
resource "aws_subnet" "public-sub-3" {
  vpc_id            = aws_vpc.cloudrock.id
  cidr_block        = var.pub_sub_3
  availability_zone = "eu-west-2c"

  tags = {
    Name = "public-sub-3"
  }
}


#private subnet 1
resource "aws_subnet" "private-sub-1" {
  vpc_id            = aws_vpc.cloudrock.id
  cidr_block        = var.pri_sub_1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "private-sub-1"
  }
}


#private subnet 2
resource "aws_subnet" "private-sub-2" {
  vpc_id            = aws_vpc.cloudrock.id
  cidr_block        = var.pri_sub_2
  availability_zone = "eu-west-2b"

  tags = {
    Name = "private-sub-2"
  }
}



#private subnet 3
resource "aws_subnet" "private-sub-3" {
  vpc_id            = aws_vpc.cloudrock.id
  cidr_block        = var.pri_sub_3
  availability_zone = "eu-west-2c"

  tags = {
    Name = "private-sub-3"
  }
}


#Public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.cloudrock.id

  tags = {
    Name = "public-rt"
  }
}


#Private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.cloudrock.id

  tags = {
    Name = "private-rt"
  }
}


#public route table association
resource "aws_route_table_association" "public-rt-1-association" {
  subnet_id      = aws_subnet.public-sub-1.id
  route_table_id = aws_route_table.public-rt.id
}


#public route table association
resource "aws_route_table_association" "public-rt-2-association" {
  subnet_id      = aws_subnet.public-sub-2.id
  route_table_id = aws_route_table.public-rt.id
}


#public route table association
resource "aws_route_table_association" "public-rt-3-association" {
  subnet_id      = aws_subnet.public-sub-3.id
  route_table_id = aws_route_table.public-rt.id
}


#private route table association
resource "aws_route_table_association" "private-rt-1-association" {
  subnet_id      = aws_subnet.private-sub-1.id
  route_table_id = aws_route_table.private-rt.id
}


#private route table association
resource "aws_route_table_association" "private-rt-2-association" {
  subnet_id      = aws_subnet.private-sub-2.id
  route_table_id = aws_route_table.private-rt.id
}


#private route table association
resource "aws_route_table_association" "private-rt-3-association" {
  subnet_id      = aws_subnet.private-sub-3.id
  route_table_id = aws_route_table.private-rt.id
}


#Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cloudrock.id

  tags = {
    Name = "igw"
  }
}


#aws route
resource "aws_route" "public-igw-route" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}
