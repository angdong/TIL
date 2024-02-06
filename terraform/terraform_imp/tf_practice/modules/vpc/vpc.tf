resource "aws_vpc" "example" {
    cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "example-a" {
    vpc_id = aws_vpc.example.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "ap-northeast-2a"
}