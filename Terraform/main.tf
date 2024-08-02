locals {

}
module "aws-instances" {
  source                      = "./modules/aws-instances"
  ami                         = var.ami
  instance_type               = var.instance_type # Corrected spelling from instatnce_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  instance_count              = var.instance_count # Assuming cou_inst is the correct variable name
  env                         = var.env
  associate_public_ip_address = "false"
  names                       = var.names
  aws_Region                  = var.aws_Region
  cidr_block                  = var.cidr_block
  availability_zone           = var.availability_zone
  private_key_path            = var.private_key_path
}
