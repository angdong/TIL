resource "aws_instance" "example" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [var.security_group_id]
    tags = {
        Schedule = "off-at-20"
    }
    subnet_id = var.subnet_id
}