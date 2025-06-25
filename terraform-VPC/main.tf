module "vpc" {
  # This module creates a VPC with public subnets
  # and outputs the VPC ID and subnet IDs
  source = "./modules/vpc"
  # Pass the CIDR block for the VPC and subnets
  vpc_cidr = var.vpc_cidr
  # Pass the names for the subnets
  my_subnet_cidr = var.my_subnet_cidr
}


module "sg" {
  # This module creates a security group in the VPC created by the vpc module
  source = "./modules/sg"
  # Pass the VPC ID to the security group module
  # From the vpc output declaration "vpc_id"
  my_security_group_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  my_sec_group_id = module.sg.my_security_group_id
  my_subnets      = module.vpc.subnet_ids
}

module "alb" {
  source = "./modules/alb"
  # Pass the security group ID created by the sg module
  var_security_group_id = module.sg.my_security_group_id
  var_alb_subnet_ids = module.vpc.subnet_ids
  # Pass the VPC ID to the ALB module
  var_my_alb_target_group_vpc_id = module.vpc.vpc_id
  var_target_id_instance = module.ec2.instance_ids
}
