resource "aws_instance" "tf-ec2-pub-a-bastion" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pub-a.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pub-bastion.id
  ]

  tags = {
    Name     = "tf-ec2-pub-a-bastion"
    Schedule = "off-at-22"
  }
}

resource "aws_instance" "tf-ec2-pri-a-web1" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pri-a-web.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pri-web.id
  ]

  tags = {
    Name     = "tf-ec2-pri-a-web1"
    Schedule = "off-at-22"
  }
}

resource "aws_instance" "tf-ec2-pri-c-web2" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pri-c-web.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pri-web.id
  ]

  tags = {
    Name     = "tf-ec2-pri-c-web2"
    Schedule = "off-at-22"
  }
}

# DB EC2
resource "aws_instance" "tf-ec2-pri-a-db1" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pri-a-db.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pri-db.id
  ]

  tags = {
    Name     = "tf-ec2-pri-a-db1"
    Schedule = "off-at-22"
  }
}

resource "aws_instance" "tf-ec2-pri-c-db2" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pri-c-db.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pri-db.id
  ]

  tags = {
    Name     = "tf-ec2-pri-c-db2"
    Schedule = "off-at-22"
  }
}

# WAS EC2
resource "aws_instance" "tf-ec2-pri-a-was1" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pri-a-was.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pri-was.id
  ]

  tags = {
    Name     = "tf-ec2-pri-a-was1"
    Schedule = "off-at-22"
  }

#   # EBS 추가 구성(tomcat 설치를 EBS에서 compile로 진행하기 위함)
#   ebs_block_device {
#     device_name = "/dev/sdb"
#     volume_size = "8"
#   }
}

resource "aws_instance" "tf-ec2-pri-c-was2" {
  ami           = "ami-0bc4327f3aabf5b71"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf-sub-pri-c-was.id
  key_name      = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [
    aws_security_group.tf-sg-pri-was.id
  ]

  tags = {
    Name     = "tf-ec2-pri-c-was2"
    Schedule = "off-at-22"
  }

  # EBS 추가 구성(tomcat 설치를 EBS에서 compile로 진행하기 위함)
#   ebs_block_device {
#     device_name = "/dev/sdb"
#     volume_size = "8"
#   }
}