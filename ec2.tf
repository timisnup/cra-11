#First instance
resource "aws_instance" "instance" {
  ami                         = var.instance_ami1
  instance_type               = "t2.micro"
  key_name                    = "demokp"
  availability_zone           = "eu-west-2a"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-sub-1.id
  vpc_security_group_ids      = [aws_security_group.assignsg.id]

  tags = {
    Name = "assign1"
  }
}

#Second instance
resource "aws_instance" "instance2" {
  ami                         = var.instance_ami2
  instance_type               = "t2.micro"
  key_name                    = "demokp"
  availability_zone           = "eu-west-2b"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-sub-2.id
  vpc_security_group_ids      = [aws_security_group.assignsg.id]

  tags = {
    Name = "assign1"
  }
}
