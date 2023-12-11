# provider "aws" {
#   profile = "default"

# }

# resource "random_pet" "instance-name" {

#   length = 3
#   prefix = "ec2"
#   separator = "-"
  
# }

# resource "random_id" "instance_id" {
#   count = 3
#   prefix = "-"
#   byte_length = "1024"

# }



# resource "aws_instance" "web-server"{
#     ami = var.ami
#     instance_type = var.instatnce_type
#     key_name = "keypair-bahrain"
#     subnet_id = var.subnet_id
#     associate_public_ip_address = true
#     count = 3
#     tags = {
#         name = "random_pet.instance-name.id - ${count.index + 1}"
#         env = "dev"
#     }
# }


# # resource "aws_instance" "mail-server" {
# #   ami = var.ami
# #   instance_type = var.instatnce_type
# #   key_name = "keypair-bahrain"
# #   subnet_id = var.subnet_id
# #   count = 2
# #   tags = {
# #     name= "mail-server-${count.index+1}"
# #     tags= "mai-server"
# #   }
# # }
