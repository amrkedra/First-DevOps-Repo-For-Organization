# provider "aws" {
#   profile = "default"
# }

# resource "aws_db_parameter_group" "first-pg" {
#   name   = "first-pg"
#   family = "mysql5.7"


#   lifecycle {
#     create_before_destroy = true
#   }
# }


# resource "aws_db_instance" "RDS-instance" {
#   identifier           = "first-db-instance"
#   allocated_storage    = 5
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "amrkedra"
#   password             = "219321932193"
#   parameter_group_name = "first-pg"
#   skip_final_snapshot  = true
#   publicly_accessible  = true

# }


# output "endpoint" {
#   value       = aws_db_instance.RDS-instance.endpoint
#   description = "value"
#   sensitive   = false


# }
# output "db_name" {
#   value = "aws_db_instance.RDS-instance.db_name - + is created"

# }

# resource "null_resource" "remove_rds" {
#   triggers = {
#     rds_instance_id = aws_db_instance.RDS-instance.arn
#   }

#   provisioner "local-exec" {
#     command = "echo 'Removing RDS instance'"
#     # Additional local-exec commands to remove the instance from external systems or perform cleanup
#   }
# }
