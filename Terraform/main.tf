locals {
  
}
module "aws-instances" {
    source = "./modules/aws-instances"
    ami = var.ami
    instance_type = var.instance_type  # Corrected spelling from instatnce_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    instance_count = var.instance_count # Assuming cou_inst is the correct variable name
    env = var.env
    associate_public_ip_address = "false"
    names = var.names
}