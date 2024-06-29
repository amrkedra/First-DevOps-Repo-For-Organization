
module "aws-instances" {
 source                      = "./modules/aws-instances"
 ami                         = var.ami
 instatnce_type = var.instance_type  # Corrected spelling from instatnce_type
 key_name                    = var.key_name
 subnet_id                   = var.subnet_id
 associate_public_ip_address = false
 count                       = var.cou_inst  # Assuming cou_inst is the correct variable name
}