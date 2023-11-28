module "ec2_instance"{
    depends_on = [ module.aws_security_group ]
    source = "./modules/ec2"
    create_ec2 = var.create_ec2
    counter = var.counter
    sg = module.aws_security_group.aws_security_group
}

module "aws_security_group" {
    source = "./modules/securitygroups"
  
}