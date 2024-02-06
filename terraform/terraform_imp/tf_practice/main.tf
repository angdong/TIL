module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    subnet_cidr_block = var.subnet_cidr_block
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_id = var.ami_id
    instance_type = var.instance_type
    security_group_id = module.security_group.security_group_id
    subnet_id = module.vpc.subnet_id
}